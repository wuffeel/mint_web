import 'package:flutter/services.dart';

/// A custom input formatter that formats input strings according to a
/// specified [pattern] while allowing only digit input.
///
/// The [pattern] is a function that takes the input value and returns a
/// formatted string.
///
/// For example, you can use `(value) => '\$$value/hr'` as a pattern to format
/// the input as "$X/hr".
///
/// If the input text is empty, it is automatically replaced by '0'. This
/// formatter also handles replacing '0' if it is the first digit of the input.
class NumericPatternInputFormatter extends TextInputFormatter {
  NumericPatternInputFormatter({this.pattern});

  final String Function(String value)? pattern;

  /// Parses the numeric value from a given text, ignoring non-digit characters.
  ///
  /// Example:
  /// ```dart
  /// final inputText = '$25/hr';
  /// final numericValue = getNumericValue(inputText); // 25
  /// ```
  ///
  /// If no numeric value is found, it returns 0.
  static int getNumericValue(String text) {
    if (text.isEmpty) return 0;
    final symbolArray = <String>[];
    for (var i = 0; i < text.length; i++) {
      try {
        int.parse(text[i]);
        symbolArray.add(text[i]);
      } catch (_) {
        continue;
      }
    }
    return int.parse(symbolArray.join());
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final pattern = this.pattern;
    final numericValue = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    final value = _validateNumericValue(numericValue);
    final formattedValue = pattern != null ? pattern(value) : value;

    final baseOffset = newValue.selection.baseOffset;
    final cursorPosition = _getCursorPosition(
      baseOffset,
      value,
      formattedValue,
    );

    return TextEditingValue(
      text: formattedValue,
      selection: _getTextSelection(
        numericValue,
        formattedValue,
        cursorPosition,
      ),
    );
  }

  /// Validates and sanitizes the numeric value, ensuring that it is not
  /// empty and handles leading zeros appropriately.
  String _validateNumericValue(String value) {
    return value.isEmpty
        ? '0'
        : (value.startsWith('0') && value.length > 1)
        ? value.substring(1)
        : value;
  }

  int _getCursorPosition(int baseOffset, String value, String formattedValue) {
    final valueLength = value.length;
    return baseOffset > valueLength
        ? formattedValue.indexOf(value) + valueLength
        : baseOffset;
  }

  TextSelection _getTextSelection(
      String numericValue,
      String formattedValue,
      int cursorPosition,
      ) {
    final zeroCursor = formattedValue.indexOf('0') + 1;

    return numericValue.isEmpty
        ? TextSelection.collapsed(offset: zeroCursor)
        : TextSelection.collapsed(offset: cursorPosition);
  }
}
