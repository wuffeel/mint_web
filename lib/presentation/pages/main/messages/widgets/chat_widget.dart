import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import 'audio_message_widget.dart';
import 'chat_bottom_bar.dart';
import 'chat_date_header.dart';
import 'chat_emoji_picker.dart';
import 'message_bubble.dart';
import 'mint_chat_theme.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({required this.room, required this.senderId, super.key});

  final types.Room room;
  final String senderId;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final _messageController = TextEditingController();
  final _messageFocusNode = FocusNode();

  var _tapPosition = Offset.zero;
  var _emojiPanelHidden = true;

  /// Stores [details] tap position in [_tapPosition] for further use by message
  /// actions pop-up menu
  void _storeTapPosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  void _onEmojiBackspace() {
    _messageController
      ..text = _messageController.text.characters.toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: _messageController.text.length),
      );
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
    _messageFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is ChatFetchMessagesSuccess) {
          return Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTapDown: _storeTapPosition,
                  child: _ChatView(
                    state,
                    widget.room,
                    widget.senderId,
                    messageController: _messageController,
                    messageFocusNode: _messageFocusNode,
                    tapPosition: _tapPosition,
                    onEmojiTap: () => setState(
                      () => _emojiPanelHidden = !_emojiPanelHidden,
                    ),
                    emojiPanelHidden: _emojiPanelHidden,
                    onBackgroundTap: () {
                      if (!_emojiPanelHidden) {
                        setState(() => _emojiPanelHidden = true);
                      }
                    },
                  ),
                ),
              ),
              if (!_emojiPanelHidden)
                SizedBox(
                  height: 250,
                  child: ChatEmojiPicker(
                    controller: _messageController,
                    focusNode: _messageFocusNode,
                    onBackSpace: _onEmojiBackspace,
                  ),
                ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ChatView extends StatefulWidget {
  const _ChatView(
    this.state,
    this.room,
    this.senderId, {
    required this.messageController,
    required this.messageFocusNode,
    required this.tapPosition,
    required this.onBackgroundTap,
    required this.onEmojiTap,
    required this.emojiPanelHidden,
  });

  final ChatFetchMessagesSuccess state;
  final types.Room room;
  final String senderId;
  final TextEditingController messageController;
  final FocusNode messageFocusNode;
  final Offset tapPosition;
  final VoidCallback onBackgroundTap;
  final VoidCallback onEmojiTap;
  final bool emojiPanelHidden;

  @override
  State<_ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<_ChatView> {
  final _emojiEnlargementBehavior = ui.EmojiEnlargementBehavior.single;
  final _hideBackgroundOnEmojiMessages = true;

  types.User get _user => widget.room.users.firstWhere(
        (e) => e.id == widget.senderId,
      );

  types.User get _receiver => widget.room.users.firstWhere(
        (e) => e.id != widget.senderId,
      );

  void _handleSendPressed() {
    final message = types.PartialText(
      text: widget.messageController.text.trim(),
    );
    context.read<ChatBloc>().add(ChatSendMessageRequested(message));

    final typingEndEvent = ChatTypingEndRequested(_user.id, widget.room.id);
    context.read<ChatTypingBloc>().add(typingEndEvent);

    widget.messageController.clear();
    widget.messageFocusNode.requestFocus();
  }

  void _handleAttachmentPressed(GlobalKey attachKey) {
    final renderBox =
        attachKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final left = offset.dx + size.width;
    final l10n = context.l10n;
    showMenu<void>(
      context: context,
      position:
          // TODO(wuffeel): investigate for better solution
          RelativeRect.fromLTRB(left, offset.dy, offset.dx + size.width, 0),
      items: [
        PopupMenuItem<String>(
          value: 'image',
          onTap: _handleImageSelection,
          child: Text(l10n.attachImage),
        ),
        PopupMenuItem<String>(
          value: 'file',
          onTap: _handleFileSelection,
          child: Text(l10n.attachFile),
        ),
        PopupMenuItem<String>(
          value: 'cancel',
          child: Text(l10n.cancel),
        ),
      ],
    );
  }

  Future<void> _handleFileSelection() async {
    return context.read<ChatBloc>().add(ChatFilePickRequested());
  }

  Future<void> _handleImageSelection() async {
    return context.read<ChatBloc>().add(ChatImagePickRequested());
  }

  /// Used to handle file open attached to [message] with [types.FileMessage]
  /// type
  void _handleMessageTap(BuildContext _, types.Message message) {
    if (message is types.FileMessage) {
      final fileLoadEvent = ChatFileLoadRequested(message, shouldOpen: false);
      return context.read<ChatBloc>().add(fileLoadEvent);
    }
  }

  void _handleTypingStart(String text) {
    final typingStartEvent = ChatTypingStartRequested(_user.id, widget.room.id);
    context.read<ChatTypingBloc>().add(typingStartEvent);
  }

  /// Calls event when http link preview data has been fetched
  void _previewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    return context
        .read<ChatBloc>()
        .add(ChatPreviewDataFetched(message, previewData));
  }

  /// Shows pop-up menu on widget.tapPosition with 'Edit' and 'Delete' actions
  void _showMessageActionsMenu(BuildContext context, types.Message message) {
    if (_isSender(message.author.id)) {
      final l10n = context.l10n;
      return ChatUtils.showMessageActionsMenu(
        context,
        message,
        widget.tapPosition,
        items: <PopupMenuEntry<void>>[
          PopupMenuItem(
            onTap: () {
              context.read<ChatBloc>().add(ChatDeleteMessageRequested(message));
              context.router.pop();
            },
            child: Text(l10n.delete, style: MintTextStyles.headline1),
          ),
        ],
      );
    }
  }

  void _markMessageAsRead(String messageId) {
    final markAsRead = PresenceMessageMarkAsRead(
      roomId: widget.room.id,
      messageId: messageId,
    );
    context.read<PresenceMessageBloc>().add(markAsRead);
  }

  /// Determines whether [userId] is current user
  bool _isSender(String userId) => _user.id == userId;

  /// Message bubble container
  Widget _bubbleBuilder(
    Widget child, {
    required types.Message message,
    required bool nextMessageInGroup,
  }) {
    final isLast = !nextMessageInGroup;
    final isSender = _isSender(message.author.id);
    final enlargeEmojis =
        _emojiEnlargementBehavior != ui.EmojiEnlargementBehavior.never &&
            message is types.TextMessage &&
            ui.isConsistsOfEmojis(_emojiEnlargementBehavior, message);

    final status = message.status;
    final seen = status != null && status == types.Status.seen;
    if (!isSender && !seen) _markMessageAsRead(message.id);

    return MessageBubble(
      isLast: isLast,
      message: message,
      isSender: isSender,
      enlargeEmojis: enlargeEmojis,
      hideBackgroundOnEmojiMessages: _hideBackgroundOnEmojiMessages,
      child: child,
    );
  }

  /// Builder that returns circular progress indicator while [message] is being
  /// uploaded to database
  Widget _messageLoadingBuilder(
    types.CustomMessage message, {
    // ignore: avoid-unused-parameters
    required int messageWidth,
  }) =>
      _MessageLoadingIndicator(
        isSender: _isSender(message.author.id),
      );

  types.User _getTypingUser(BuildContext context) {
    final firstName = _receiver.firstName;
    return firstName != null
        ? _receiver
        : _receiver.copyWith(firstName: context.l10n.patient);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChatTypingBloc, ChatTypingState, bool?>(
      selector: (typingState) =>
          typingState.typingMap[widget.room.id]?[_receiver.id],
      builder: (context, isReceiverTyping) {
        return ui.Chat(
          audioMessageBuilder: (
            audio, {
            required int messageWidth,
          }) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: AudioMessageWidget(
                message: audio,
                isSender: _isSender(audio.author.id),
              ),
            );
          },
          bubbleBuilder: _bubbleBuilder,
          customBottomWidget: ChatBottomBar(
            controller: widget.messageController,
            focusNode: widget.messageFocusNode,
            onSend: _handleSendPressed,
            onEmoji: widget.onEmojiTap,
            onAttach: _handleAttachmentPressed,
            onAudioStop: (audioPath, duration) {
              context
                  .read<ChatBloc>()
                  .add(ChatSaveAudioRequested(audioPath, duration));
            },
            onTextChanged: _handleTypingStart,
            isEmojiSelected: !widget.emojiPanelHidden,
          ),
          customMessageBuilder: _messageLoadingBuilder,
          dateLocale: context.l10n.localeName,
          dateHeaderBuilder: (date) {
            return Center(
              child: ChatDateHeader(
                date: date.dateTime,
                text: date.text,
              ),
            );
          },
          // 3 minutes
          groupMessagesThreshold: 180000,
          // 24 hours
          dateHeaderThreshold: 86400000,
          emojiEnlargementBehavior: _emojiEnlargementBehavior,
          hideBackgroundOnEmojiMessages: _hideBackgroundOnEmojiMessages,
          messages: widget.state.messages,
          onBackgroundTap: widget.onBackgroundTap,
          onMessageTap: _handleMessageTap,
          onMessageLongPress: _showMessageActionsMenu,
          onPreviewDataFetched: _previewDataFetched,
          onSendPressed: (_) {
            // implemented in customBottomWidget
          },
          scrollToUnreadOptions: ui.ScrollToUnreadOptions(
            lastReadMessageId: widget.state.messages.lastWhereOrNull((msg) {
              final status = msg.status;
              if (msg.author.id == _user.id) return false;
              return status != null && status != types.Status.seen;
            })?.id,
            scrollDelay: const Duration(milliseconds: 20),
            scrollDuration: const Duration(milliseconds: 100),
            scrollOnOpen: true,
          ),
          theme: MintChatTheme(context),
          typingIndicatorOptions: ui.TypingIndicatorOptions(
            animationSpeed: const Duration(seconds: 1),
            typingUsers: isReceiverTyping != null && isReceiverTyping
                ? [_getTypingUser(context)]
                : [],
          ),
          user: _user,
        );
      },
    );
  }
}

class _MessageLoadingIndicator extends StatelessWidget {
  const _MessageLoadingIndicator({required this.isSender});

  final bool isSender;

  bool _isThemeDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  Color _getProperOpaqueColor(BuildContext context) {
    return _isThemeDark(context)
        ? Colors.white
        : isSender
            ? Colors.white
            : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          color: _getProperOpaqueColor(context),
          strokeWidth: 2,
        ),
      ),
    );
  }
}
