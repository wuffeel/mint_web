import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../bloc/onboarding/onboarding_bloc.dart';
import 'onboarding_page_container.dart';

class PricingWidget extends StatelessWidget {
  const PricingWidget(
    this.pricingControl, {
    required this.onBack,
    required this.onNext,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onNext;
  final FormControl<int> pricingControl;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return ReactiveFormField(
          formControl: pricingControl,
          validationMessages: {
            ValidationMessage.min: (error) => l10n.enterCorrectPrice,
          },
          builder: (field) {
            final errorText = field.errorText;
            return OnboardingPageContainer(
              title: l10n.pricing,
              subTitle: l10n.setCompetitivePrice,
              onBack: onBack,
              onNext: field.control.valid ? onNext : null,
              child: _TextField(
                errorText: errorText,
                selectedPricing: field.control.value ?? 0,
                onChange: (value) {
                  pricingControl
                    ..updateValue(value)
                    ..markAsTouched();
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    required this.selectedPricing,
    required this.onChange,
    this.errorText,
  });

  final int selectedPricing;
  final void Function(int) onChange;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(counterText: '', errorText: errorText),
      initialValue: '₴$selectedPricing/hr',
      inputFormatters: [_PricingInputFormatter()],
      maxLength: 9,
      onChanged: (pricing) {
        onChange(_PricingInputFormatter.getPrice(pricing));
      },
    );
  }
}

class _PricingInputFormatter extends TextInputFormatter {
  static int getPrice(String pricing) {
    final symbolArray = <String>[];
    for (var i = 0; i < pricing.length; i++) {
      try {
        int.parse(pricing[i]);
        symbolArray.add(pricing[i]);
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
