import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    required this.isLast,
    required this.isSender,
    required this.enlargeEmojis,
    required this.hideBackgroundOnEmojiMessages,
    required this.child,
    super.key,
  });

  final types.Message message;
  final bool isLast;
  final bool isSender;
  final bool enlargeEmojis;
  final bool hideBackgroundOnEmojiMessages;
  final Widget child;

  BorderRadius _getBorderShape(bool isSender, bool isLast) {
    return BorderRadius.only(
      topLeft: const Radius.circular(10),
      topRight: const Radius.circular(10),
      bottomRight: Radius.circular(!isSender || !isLast ? 10 : 0),
      bottomLeft: Radius.circular(isSender || !isLast ? 10 : 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (enlargeEmojis && hideBackgroundOnEmojiMessages)
          child
        else
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: _getBorderShape(isSender, isLast).resolve(
                Directionality.of(context),
              ),
              color: !isSender || message.type == types.MessageType.image
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
            child: ClipRRect(
              borderRadius: _getBorderShape(isSender, isLast).resolve(
                Directionality.of(context),
              ),
              child: child,
            ),
          ),
        if (isLast) ...[
          const SizedBox(height: 8),
          _MessageCreatedAt(createdAt: message.createdAt),
        ],
      ],
    );
  }
}

class _MessageCreatedAt extends StatelessWidget {
  const _MessageCreatedAt({this.createdAt});

  final int? createdAt;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.Hm().format(
        DateTime.fromMillisecondsSinceEpoch(createdAt ?? 0),
      ),
      style: TextStyle(
        fontSize: 10,
        color: Theme.of(context).hintColor.withOpacity(0.6),
      ),
    );
  }
}
