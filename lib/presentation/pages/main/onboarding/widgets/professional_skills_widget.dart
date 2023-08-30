import 'package:flutter/material.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../widgets/mint_multi_item_selection.dart';
import 'onboarding_page_container.dart';

class ProfessionalSkillsWidget extends StatefulWidget {
  const ProfessionalSkillsWidget({
    required this.onBack,
    required this.onNext,
    required this.selectedSpecializations,
    required this.onChange,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onNext;
  final List<String>? selectedSpecializations;
  final void Function(List<String>?) onChange;

  @override
  State<ProfessionalSkillsWidget> createState() =>
      _ProfessionalSkillsWidgetState();
}

class _ProfessionalSkillsWidgetState extends State<ProfessionalSkillsWidget> {
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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return OnboardingPageContainer(
      title: l10n.professionalSkills,
      subTitle: l10n.selectAsManyAsApply,
      onBack: widget.onBack,
      onNext: widget.onNext,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 500),
        child: SingleChildScrollView(
          child: MintMultiItemSelection(
            items: items,
            itemTitles: items,
            selectedItems: widget.selectedSpecializations ?? <String>[],
            onItemSelected: widget.onChange,
            itemInnerPadding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 8,
            ),
            mainSpacing: 8,
            crossSpacing: 8,
          ),
        ),
      ),
    );
  }
}
