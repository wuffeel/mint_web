import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    required this.isSelected,
    required this.lastMessageContent,
    required this.lastMessageTime,
    required this.user,
    super.key,
  });

  final String lastMessageContent;
  final DateTime lastMessageTime;
  final bool isSelected;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final photo = user.photoUrl;
    return Container(
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
          CircleAvatar(
            radius: 28,
            backgroundColor: Theme.of(context).hintColor.withOpacity(0.6),
            backgroundImage: photo != null ? NetworkImage(photo) : null,
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
                    style: MintTextStyles.semiBold16,
                  ),
                  Text(
                    lastMessageContent,
                    overflow: TextOverflow.ellipsis,
                    style: MintTextStyles.regular14,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            DateFormat.Hm().format(lastMessageTime),
            style: MintTextStyles.regular14,
          ),
        ],
      ),
    );
  }
}
