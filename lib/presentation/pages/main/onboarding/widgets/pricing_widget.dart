import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../utils/numeric_pattern_input_formatter.dart';
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
      inputFormatters: [
        NumericPatternInputFormatter(pattern: (value) => '₴$value/hr'),
      ],
      maxLength: 9,
      onChanged: (pricing) {
        onChange(NumericPatternInputFormatter.getNumericValue(pricing));
      },
    );
  }
}
