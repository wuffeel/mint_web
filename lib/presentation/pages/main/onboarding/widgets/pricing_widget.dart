import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../l10n/l10n.dart';
import 'onboarding_page_container.dart';

class PricingWidget extends StatefulWidget {
  const PricingWidget({
    required this.onBack,
    required this.onNext,
    required this.selectedPricing,
    required this.onChange,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onNext;
  final int selectedPricing;
  final void Function(int) onChange;

  @override
  State<PricingWidget> createState() => _PricingWidgetState();
}

class _PricingWidgetState extends State<PricingWidget> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return OnboardingPageContainer(
      title: l10n.pricing,
      subTitle: l10n.setCompetitivePrice,
      onBack: widget.onBack,
      onNext: widget.onNext,
      child: TextFormField(
        decoration: const InputDecoration(counterText: ''),
        initialValue: '₴${widget.selectedPricing}/hr',
        inputFormatters: [_PricingInputFormatter()],
        maxLength: 9,
        onChanged: (pricing) {
          final price = pricing.split('/').first;
          final priceWithoutCurrency = price.substring(1, price.length);
          widget.onChange(int.parse(priceWithoutCurrency));
        },
      ),
    );
  }
}

class _PricingInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final numericValue = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    final value = _validateNumericValue(numericValue);
    final formattedValue = _formatPricingValue(value);

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

  /// Returns '₴[value]/hr' String
  String _formatPricingValue(String value) {
    return '₴$value/hr';
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
