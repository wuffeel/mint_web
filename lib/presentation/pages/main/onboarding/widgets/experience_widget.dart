import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../domain/entity/onboarding/onboarding.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/form_field_container.dart';
import 'onboarding_page_container.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget(
    this.form, {
    required this.onBack,
    required this.onNext,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onNext;
  final ExperienceInfoForm form;

  bool? _hasRequiredError(Map<String, Object>? errors) {
    if (errors == null) return null;
    return errors.containsKey(ValidationMessage.requiredTrue);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String required(Object input) => l10n.fieldIsRequired;
    return ReactiveOnboardingFormConsumer(
      builder: (context, formModel, child) {
        final control = formModel.experienceInfoControl;
        return OnboardingPageContainer(
          title: l10n.yourExperience,
          subTitle: l10n.alongWithYourProfessionalSkills,
          onBack: onBack,
          onNext: (control?.valid ?? true) ? onNext : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                l10n.selectWhenYouStartedYourCareer,
                style: MintTextStyles.headline1,
              ),
              const SizedBox(height: 16),
              ReactiveFormField(
                formControl: form.noExperienceControl,
                builder: (ReactiveFormFieldState<bool, dynamic> field) {
                  return ReactiveDatePicker(
                    formControl: form.experienceControl,
                    builder: (context, picker, child) {
                      return _DateOfExperience(
                        experienceDate: picker.value,
                        noExperience: field.control.value ?? false,
                        onTap: picker.showPicker,
                      );
                    },
                    firstDate: DateTime(DateTime.now().year - 65),
                    lastDate: DateTime.now(),
                  );
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ReactiveCheckbox(
                    formControl: form.noExperienceControl,
                    activeColor: MintColors.primaryBlueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    splashRadius: 0,
                  ),
                  const SizedBox(width: 4),
                  Text(l10n.iDoNotHaveExperience),
                ],
              ),
              if (_hasRequiredError(control?.errors) ?? false) ...[
                const SizedBox(height: 8),
                Text(l10n.fieldIsRequired, style: MintTextStyles.error),
              ],
              const SizedBox(height: 16),
              Text(
                l10n.writeAboutYourBackgroundAndYourself,
                style: MintTextStyles.headline1,
              ),
              const SizedBox(height: 16),
              ReactiveTextField<String>(
                formControl: form.aboutControl,
                decoration: InputDecoration(hintText: '${l10n.typeHere}...'),
                maxLines: 6,
                validationMessages: {ValidationMessage.required: required},
              ),
              const SizedBox(height: 10),
              Text(
                l10n.writeAboutYourEducation,
                style: MintTextStyles.headline1,
              ),
              const SizedBox(height: 16),
              ReactiveTextField<String>(
                formControl: form.educationControl,
                decoration: InputDecoration(hintText: '${l10n.typeHere}...'),
                maxLines: 6,
                validationMessages: {ValidationMessage.required: required},
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DateOfExperience extends StatelessWidget {
  const _DateOfExperience({
    required this.experienceDate,
    required this.noExperience,
    required this.onTap,
  });

  final DateTime? experienceDate;
  final bool noExperience;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final date = experienceDate;
    return InkWell(
      onTap: onTap,
      child: FormFieldContainer(
        child: SizedBox(
          width: double.infinity,
          child: Text(
            date != null
                ? DateFormat.yMd(context.l10n.localeName).format(date)
                : context.l10n.experience,
            style: MintTextStyles.body.copyWith(
              color: experienceDate == null || noExperience
                  ? Theme.of(context).hintColor.withOpacity(0.3)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
