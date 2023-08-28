import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';

import '../../../../../l10n/l10n.dart';

class OtpSentText extends StatelessWidget {
  const OtpSentText({required this.phoneNumber, super.key});

  final String phoneNumber;

  /// Returns formatted phone number with spaces based on phone number.
  /// If could not format the given [phoneNumber], returns unformatted.
  ///
  /// For [phoneNumber] with pattern like '+380123456789' will return the
  /// '+380 12 345 6789' formatted string
  String? _formatPhoneNumber(String phoneNumber) {
    return formatAsPhoneNumber(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: context.l10n.codeWasSentTo,
            style: TextStyle(
              fontSize: 14,
              height: 1.1,
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          ),
          const TextSpan(
            text: ' ',
            style: TextStyle(fontSize: 14, height: 1.1),
          ),
          TextSpan(
            text: _formatPhoneNumber(phoneNumber),
            style: TextStyle(
              fontSize: 14,
              height: 1.1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
