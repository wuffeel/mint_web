import 'package:flutter/cupertino.dart';

import '../l10n/l10n.dart';

class ValidationUtil {
  static const _emailValidatorRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String? emptyValidator(BuildContext context, String? value) {
    final l10n = context.l10n;

    if (value == null || value.isEmpty) {
      return l10n.fieldShouldNotBeEmpty;
    }
    return null;
  }

  static String? emailValidator(BuildContext context, String? value) {
    final l10n = context.l10n;

    if (value == null || value.isEmpty) {
      return l10n.fieldShouldNotBeEmpty;
    }
    final isValid = RegExp(_emailValidatorRegex).hasMatch(value);

    return isValid ? null : l10n.invalidEmail;
  }
}
