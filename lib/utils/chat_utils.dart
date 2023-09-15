import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

import '../l10n/l10n.dart';
import '../theme/mint_text_styles.dart';

class ChatUtils {
  /// Shows pop-up menu on given [tapPosition] for [message] with _Delete_
  /// action
  static void showMessageActionsMenu(
      BuildContext context,
      Message message,
      Offset tapPosition, {
        required void Function(Message) onDelete,
      }) {
    final overlaySize =
        Overlay.of(context).context.findRenderObject()?.semanticBounds.size;
    if (overlaySize == null) return;

    final l10n = context.l10n;

    final items = <PopupMenuEntry<void>>[
      PopupMenuItem(
        onTap: () => onDelete(message),
        // TODO(wuffeel): add localization
        child: const Text('Delete', style: MintTextStyles.headline1),
      ),
    ];

    showMenu<void>(
      context: context,
      position: RelativeRect.fromRect(
        tapPosition & const Size(40, 40),
        Offset.zero & overlaySize,
      ),
      items: items,
    );
  }
}
