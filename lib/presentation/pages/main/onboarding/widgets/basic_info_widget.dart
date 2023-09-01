import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../domain/entity/onboarding/onboarding.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../bloc/user/user_bloc.dart';
import '../../../../widgets/form_field_container.dart';
import 'onboarding_page_container.dart';

class BasicInfoWidget extends StatelessWidget {
  const BasicInfoWidget(
    this.form, {
    required this.onNext,
    super.key,
  });

  final BasicInfoForm form;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String required(Object input) => l10n.fieldIsRequired;
    return ReactiveOnboardingFormConsumer(
      builder: (context, onboarding, child) => OnboardingPageContainer(
        title: l10n.basicInformation,
        subTitle: l10n.letsGiveYourPatientsBetterSense,
        onNext: (onboarding.basicInfoControl?.valid ?? true) ? onNext : null,
        forceBackButton: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ReactiveTextField<String>(
              formControl: form.firstNameControl,
              decoration: InputDecoration(hintText: l10n.firstName),
              onSubmitted: (_) => form.form.focus(
                BasicInfoForm.lastNameControlName,
              ),
              textInputAction: TextInputAction.next,
              validationMessages: {
                ValidationMessage.required: required,
              },
            ),
            const SizedBox(height: 16),
            ReactiveTextField<String>(
              formControl: form.lastNameControl,
              decoration: InputDecoration(hintText: l10n.lastName),
              onSubmitted: (_) => form.form.focus(
                BasicInfoForm.emailControlName,
              ),
              textInputAction: TextInputAction.next,
              validationMessages: {
                ValidationMessage.required: required,
              },
            ),
            const SizedBox(height: 16),
            ReactiveTextField<String>(
              formControl: form.emailControl,
              decoration: InputDecoration(hintText: l10n.email),
              validationMessages: {
                ValidationMessage.required: required,
                ValidationMessage.email: (input) => l10n.invalidEmail,
              },
            ),
            const SizedBox(height: 16),
            const _PhoneNumberField(),
            const SizedBox(height: 16),
            ReactiveDatePicker(
              formControl: form.dateOfBirthControl,
              builder: (context, picker, child) {
                return _DateOfBirthField(
                  dateOfBirth: picker.value,
                  onTap: picker.showPicker,
                );
              },
              firstDate: DateTime(DateTime.now().year - 65),
              lastDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhoneNumberField extends StatelessWidget {
  const _PhoneNumberField();

  String _formattedPhone(String phoneNumber) {
    return formatAsPhoneNumber(phoneNumber) ?? phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserAuthenticated) {
          final phone = state.user.phoneNumber;
          return FormFieldContainer(
            child: SizedBox(
              width: double.infinity,
              child: Text(
                phone != null ? _formattedPhone(phone) : '',
                style: MintTextStyles.body,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _DateOfBirthField extends StatelessWidget {
  const _DateOfBirthField({required this.dateOfBirth, required this.onTap});

  final DateTime? dateOfBirth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final date = dateOfBirth;
    return InkWell(
      onTap: onTap,
      child: FormFieldContainer(
        child: SizedBox(
          width: double.infinity,
          child: Text(
            date != null
                ? DateFormat.yMd(context.l10n.localeName).format(date)
                : context.l10n.dateOfBirth,
            style: MintTextStyles.body.copyWith(
              color: date == null
                  ? Theme.of(context).hintColor.withOpacity(0.3)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
