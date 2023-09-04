import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_multi_item_selection.dart';
import 'onboarding_page_container.dart';

class ProfessionalSkillsWidget extends StatelessWidget {
  const ProfessionalSkillsWidget(
    this.control,
    this.specializations, {
    required this.onBack,
    required this.onNext,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onNext;
  final FormControl<List<String>> control;
  final List<String> specializations;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    String required(Object input) => l10n.selectAtLeastOneSkill;
    return ReactiveFormField(
      formControl: control,
      validationMessages: {ValidationMessage.required: required},
      builder: (ReactiveFormFieldState<List<String>, dynamic> field) {
        final errorText = field.errorText;
        return OnboardingPageContainer(
          title: l10n.professionalSkills,
          subTitle: l10n.selectAsManyAsApply,
          onBack: onBack,
          onNext: (field.control.value ?? []).isNotEmpty ? onNext : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MintMultiItemSelection(
                    items: specializations,
                    itemTitles: specializations,
                    selectedItems: control.value ?? <String>[],
                    onItemSelected: (list) {
                      control.updateValue(list);
                      if (!control.touched) {
                        control.markAsTouched();
                      }
                    },
                    itemInnerPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    mainSpacing: 8,
                    crossSpacing: 8,
                  ),
                  if (errorText != null) ...[
                    const SizedBox(height: 8),
                    Text(errorText, style: MintTextStyles.error),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
