import 'package:flutter/material.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';

class ChatDateHeader extends StatelessWidget {
  const ChatDateHeader({required this.date, required this.text, super.key});

  final DateTime date;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: MintColors.chatDateHeaderGrey,
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        DateTimeUtils.isSameDay(date, DateTime.now())
            ? context.l10n.today
            : text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
