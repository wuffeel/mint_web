import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../domain/entity/onboarding/onboarding.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_multi_item_selection.dart';
import 'onboarding_page_container.dart';

class ProfessionalSkillsWidget extends StatelessWidget {
  const ProfessionalSkillsWidget(
    this.specializations, {
    required this.onBack,
    required this.onNext,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onNext;
  final FormControl<List<String>> specializations;

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Fears',
      'Problems with self-control',
      'Relationships with oneself',
      'Emotions',
      'My development',
      'Relationship with children',
      'Career',
      'Finances',
    ];
    final l10n = context.l10n;
    return ReactiveFormField(
      formControl: specializations,
      builder: (ReactiveFormFieldState<List<String>, dynamic> field) {
        return OnboardingPageContainer(
          title: l10n.professionalSkills,
          subTitle: l10n.selectAsManyAsApply,
          onBack: onBack,
          onNext: (field.control.value?.isNotEmpty ?? false) ? onNext : null,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MintMultiItemSelection(
                    items: items,
                    itemTitles: items,
                    selectedItems: specializations.value ?? <String>[],
                    onItemSelected: specializations.updateValue,
                    itemInnerPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    mainSpacing: 8,
                    crossSpacing: 8,
                  ),
                  if (field.control.errors.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      l10n.selectAtLeastOneSkill,
                      style: MintTextStyles.error,
                    ),
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
