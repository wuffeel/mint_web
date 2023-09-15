import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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
    return Wrap(
      children: [
        TextButton(
          onPressed: () {
            context.router.pop();
            onImageAttach();
          },
          child: const Align(
            alignment: AlignmentDirectional.centerStart,
            // TODO(wuffeel): add localization
            child: Text('Attach image'),
          ),
        ),
        TextButton(
          onPressed: () {
            context.router.pop();
            onFileAttach();
          },
          child: const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text('Attach file'),
          ),
        ),
        TextButton(
          onPressed: context.router.pop,
          child: const Align(
            alignment: AlignmentDirectional.centerStart,
            // TODO(wuffeel): add localization
            child: Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
