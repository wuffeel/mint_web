import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_circle_avatar.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    required this.isSelected,
    required this.lastMessage,
    required this.user,
    required this.onTap,
    this.unreadCount = 0,
    super.key,
  });

  final types.Message? lastMessage;
  final bool isSelected;
  final UserModel user;
  final VoidCallback? onTap;
  final int unreadCount;

  String _getLastMessageContent(types.Message lastMessage) {
    if (lastMessage is types.TextMessage) {
      return lastMessage.text;
    } else if (lastMessage is types.ImageMessage) {
      return lastMessage.name;
    } else if (lastMessage is types.FileMessage) {
      return lastMessage.name;
    } else if (lastMessage is types.AudioMessage) {
      return lastMessage.name;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final message = lastMessage;
    final updatedAt = lastMessage?.updatedAt;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 95,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: !isSelected
              ? Colors.white
              : MintColors.selectedMessageBlue.withOpacity(0.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MintCircleAvatar(
              radius: 28,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              photoUrl: user.photoUrl,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.fullName ?? l10n.patient,
                      maxLines: 2,
                      style: MintTextStyles.semiBold16,
                    ),
                    Text(
                      message != null
                          ? _getLastMessageContent(message)
                          : l10n.noMessagesYet,
                      overflow: TextOverflow.ellipsis,
                      style: MintTextStyles.regular14,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  updatedAt != null
                      ? DateFormat.Hm().format(
                          DateTime.fromMillisecondsSinceEpoch(updatedAt),
                        )
                      : '',
                  style: MintTextStyles.regular14,
                ),
                if (unreadCount != 0) ...[
                  const SizedBox(height: 5),
                  _UnreadMessagesContainer(unreadCount: unreadCount),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _UnreadMessagesContainer extends StatelessWidget {
  const _UnreadMessagesContainer({required this.unreadCount});

  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 5,
      ),
      child: Text(
        unreadCount.toString(),
        style: MintTextStyles.poppins.copyWith(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
