import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../../../../../l10n/l10n.dart';
import 'chat_bottom_bar.dart';
import 'chat_date_header.dart';
import 'message_bubble.dart';
import 'mint_chat_theme.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({required this.room, required this.patientId, super.key});

  final types.Room room;
  final String patientId;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final _messageController = TextEditingController();

  var _emojiPanelHidden = true;
  final _emojiEnlargementBehavior = EmojiEnlargementBehavior.single;
  final _hideBackgroundOnEmojiMessages = true;

  late final _user = widget.room.users.firstWhere(
    (e) => e.id != widget.patientId,
  );

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
        _emojiEnlargementBehavior != EmojiEnlargementBehavior.never &&
            message is types.TextMessage &&
            isConsistsOfEmojis(_emojiEnlargementBehavior, message);

    return MessageBubble(
      isLast: isLast,
      message: message,
      isSender: isSender,
      enlargeEmojis: enlargeEmojis,
      hideBackgroundOnEmojiMessages: _hideBackgroundOnEmojiMessages,
      child: child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chat(
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
        onSend: () {
          // TODO(wuffeel): handle send pressed
        },
        onEmoji: () {
          setState(() {
            _emojiPanelHidden = !_emojiPanelHidden;
          });
          // Removes keyboard if it is shown
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onAttach: () {
          // TODO(wuffeel): handle attach pressed
        },
        onAudioStop: (audioMessage) {
          // TODO(wuffeel): handle audio stop
        },
        isEmojiSelected: !_emojiPanelHidden,
        onTextFieldTap: () => setState(
          () => _emojiPanelHidden = true,
        ),
      ),
      dateLocale: context.l10n.localeName,
      dateHeaderBuilder: (date) {
        return ChatDateHeader(
          date: date.dateTime,
          text: date.text,
        );
      },
      // 24 hours
      dateHeaderThreshold: 86400000,
      emojiEnlargementBehavior: _emojiEnlargementBehavior,
      hideBackgroundOnEmojiMessages: _hideBackgroundOnEmojiMessages,
      // TODO(wuffeel): add messages list
      messages: const [
        types.TextMessage(
          author: types.User(id: '123'),
          id: '1',
          text: 'Test1',
        ),
        types.TextMessage(
          author: types.User(id: 'yQcfMMlAXYYoRuKqXemHf2yx55g2'),
          id: '1',
          text: 'Test1',
        ),
      ],
      onBackgroundTap: () {
        if (!_emojiPanelHidden) {
          setState(
            () => _emojiPanelHidden = true,
          );
        }
      },
      onSendPressed: (_) {
        // TODO(wuffel): implemented in customBottomWidget
      },
      theme: MintChatTheme(context),
      user: _user,
    );
  }
}
