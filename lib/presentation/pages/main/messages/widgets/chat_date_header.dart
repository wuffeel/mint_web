import 'package:flutter/material.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../l10n/l10n.dart';

class ChatDateHeader extends StatelessWidget {
  const ChatDateHeader({required this.date, required this.text, super.key});

  final DateTime date;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 32, top: 16),
      child: Text(
        DateTimeUtils.isSameDay(date, DateTime.now())
            ? context.l10n.today
            : text,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
