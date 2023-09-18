import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/l10n.dart';

class ChatAttachBottomSheet extends StatelessWidget {
  const ChatAttachBottomSheet({
    required this.onImageAttach,
    required this.onFileAttach,
    super.key,
  });

  final VoidCallback onImageAttach;
  final VoidCallback onFileAttach;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Wrap(
      children: [
        TextButton(
          onPressed: () {
            context.router.pop();
            onImageAttach();
          },
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(l10n.attachImage),
          ),
        ),
        TextButton(
          onPressed: () {
            context.router.pop();
            onFileAttach();
          },
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(l10n.attachFile),
          ),
        ),
        TextButton(
          onPressed: context.router.pop,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(l10n.cancel),
          ),
        ),
      ],
    );
  }
}
