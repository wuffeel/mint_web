import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;
import 'package:mint_core/mint_bloc.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../utils/chat_utils.dart';
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
  final _emojiEnlargementBehavior = ui.EmojiEnlargementBehavior.single;
  final _hideBackgroundOnEmojiMessages = true;

  late final _user = widget.room.users.firstWhere(
    (e) => e.id == widget.senderId,
  );

  void _handleSendPressed() {
    final message = types.PartialText(text: _messageController.text.trim());
    context.read<ChatBloc>().add(ChatSendMessageRequested(message));
    _messageController.clear();
    _messageFocusNode.requestFocus();
  }

  void _handleAttachmentPressed(GlobalKey attachKey) {
    final renderBox =
        attachKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    final left = offset.dx + size.width;
    showMenu<void>(
      context: context,
      position:
          // TODO(wuffeel): investigate for better solution
          RelativeRect.fromLTRB(left, offset.dy, offset.dx + size.width, 0),
      items: [
        // TODO(wuffeel): add localization
        PopupMenuItem<String>(
          value: 'image',
          onTap: _handleImageSelection,
          child: const Text('Attach image'),
        ),
        PopupMenuItem<String>(
          value: 'file',
          onTap: _handleFileSelection,
          child: const Text('Attach file'),
        ),
        const PopupMenuItem<String>(
          value: 'cancel',
          child: Text('Cancel'),
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
    final shouldOpen = message is types.FileMessage;
    if (message is types.FileMessage || message is types.AudioMessage) {
      return context.read<ChatBloc>().add(
            ChatFileLoadRequested(
              message,
              shouldOpen: shouldOpen,
            ),
          );
    }
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

  /// Shows pop-up menu on [_tapPosition] with 'Edit' and 'Delete' actions
  void _showMessageActionsMenu(BuildContext context, types.Message message) {
    if (_isSender(message.author.id)) {
      return ChatUtils.showMessageActionsMenu(
        context,
        message,
        _tapPosition,
        onDelete: (message) {
          context.read<ChatBloc>().add(ChatDeleteMessageRequested(message));
          context.router.pop();
        },
      );
    }
  }

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

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
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
                  child: ui.Chat(
                    audioMessageBuilder: (
                      audio, {
                      required int messageWidth,
                    }) {
                      return const Padding(
                        padding: EdgeInsets.all(8),
                        // TODO(wuffel): add chat audio message UI
                      );
                    },
                    bubbleBuilder: _bubbleBuilder,
                    customBottomWidget: ChatBottomBar(
                      controller: _messageController,
                      focusNode: _messageFocusNode,
                      onSend: _handleSendPressed,
                      onEmoji: () {
                        setState(() {
                          _emojiPanelHidden = !_emojiPanelHidden;
                        });
                      },
                      onAttach: _handleAttachmentPressed,
                      onAudioStop: (audioMessage) {
                        context
                            .read<ChatBloc>()
                            .add(ChatSaveAudioRequested(audioMessage));
                      },
                      isEmojiSelected: !_emojiPanelHidden,
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
                    // 24 hours
                    dateHeaderThreshold: 86400000,
                    emojiEnlargementBehavior: _emojiEnlargementBehavior,
                    hideBackgroundOnEmojiMessages:
                        _hideBackgroundOnEmojiMessages,
                    messages: state.messages,
                    onBackgroundTap: () {
                      if (!_emojiPanelHidden) {
                        setState(
                          () => _emojiPanelHidden = true,
                        );
                      }
                    },
                    onMessageTap: _handleMessageTap,
                    onMessageLongPress: _showMessageActionsMenu,
                    onPreviewDataFetched: _previewDataFetched,
                    onSendPressed: (_) {
                      // TODO(wuffel): implemented in customBottomWidget
                    },
                    theme: MintChatTheme(context),
                    user: _user,
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
