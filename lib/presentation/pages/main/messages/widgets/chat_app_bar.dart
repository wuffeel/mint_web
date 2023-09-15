import 'package:flutter/material.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_circle_avatar.dart';
import '../../../../widgets/svg_icon_widget.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    required this.user,
    required this.isOnline,
    super.key,
  });

  final UserModel user;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 30),
        child: Row(
          children: <Widget>[
            MintCircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              photoUrl: user.photoUrl,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user.fullName ?? context.l10n.patient,
                  style: MintTextStyles.semiBold16,
                ),
                const SizedBox(height: 2),
                Text(
                  (isOnline ? l10n.online : l10n.offline).toLowerCase(),
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
            const Spacer(),
            const SizedBox(width: 10),
            SvgIconWidget(Assets.svg.phoneIcon, width: 22, height: 22),
            const SizedBox(width: 40),
            SvgIconWidget(Assets.svg.actionsVertical, width: 22, height: 22),
          ],
        ),
      ),
    );
  }
}
