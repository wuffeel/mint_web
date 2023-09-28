import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'package:mint_core/mint_utils.dart';

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
    this.roomLastDate,
    super.key,
  });

  final types.Message? lastMessage;
  final bool isSelected;
  final types.User user;
  final VoidCallback? onTap;
  final int unreadCount;
  final int? roomLastDate;

  String _getLastMessageContent(
    BuildContext context,
    types.Message lastMessage,
  ) {
    final l10n = context.l10n;
    if (lastMessage is types.TextMessage) {
      return lastMessage.text;
    } else if (lastMessage is types.ImageMessage) {
      return l10n.imageMessage;
    } else if (lastMessage is types.FileMessage) {
      return lastMessage.name;
    } else if (lastMessage is types.AudioMessage) {
      return l10n.voiceMessage;
    }
    return '';
  }

  String _getUpdatedAtDateTime(BuildContext context, int updatedAt) {
    final updatedDate = DateTime.fromMillisecondsSinceEpoch(updatedAt);
    final now = DateTime.now();
    final isToday = DateTimeUtils.isSameDay(now, updatedDate);
    final daysDifference = now.difference(updatedDate).inDays;
    final locale = context.l10n.localeName;

    if (isToday) {
      return DateFormat.Hm(locale).format(updatedDate);
    } else if (daysDifference < 7) {
      return DateFormat.E(locale).format(updatedDate);
    } else {
      return DateFormat.yMd(locale).format(updatedDate);
    }
  }

  String? get _fullName => user.firstName != null && user.lastName != null
      ? '${user.firstName} ${user.lastName}'
      : null;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final message = lastMessage;
    final lastDate =
        lastMessage?.updatedAt ?? lastMessage?.createdAt ?? roomLastDate;
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
              photoUrl: user.imageUrl,
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
                      _fullName ?? l10n.patient,
                      maxLines: 2,
                      style: MintTextStyles.semiBold16,
                    ),
                    Text(
                      message != null
                          ? _getLastMessageContent(context, message)
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
            FractionallySizedBox(
              heightFactor: 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  if (lastDate != null)
                    Text(
                      _getUpdatedAtDateTime(context, lastDate),
                      style: MintTextStyles.regular14,
                    ),
                  if (unreadCount != 0)
                    _UnreadMessagesContainer(unreadCount: unreadCount)
                  else if (lastMessage?.status == types.Status.delivered &&
                      lastMessage?.author.id != user.id)
                    Image.asset(
                      'assets/icon-delivered.png',
                      color: Theme.of(context).colorScheme.primary,
                      package: 'flutter_chat_ui',
                    )
                  else if (lastMessage?.status == types.Status.seen &&
                      lastMessage?.author.id != user.id)
                    Image.asset(
                      'assets/icon-seen.png',
                      color: Theme.of(context).colorScheme.primary,
                      package: 'flutter_chat_ui',
                    ),
                ],
              ),
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
