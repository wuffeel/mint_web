import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/entity/experience_model.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/form_field_container.dart';
import 'onboarding_page_container.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({
    required this.onBack,
    required this.onNext,
    required this.experienceData,
    required this.onChange,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onNext;
  final ExperienceModel experienceData;
  final void Function(ExperienceModel) onChange;

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final onChange = widget.onChange;
    final experienceData = widget.experienceData;
    return OnboardingPageContainer(
      title: l10n.yourExperience,
      subTitle: l10n.alongWithYourProfessionalSkills,
      onBack: widget.onBack,
      onNext: widget.onNext,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.selectWhenYouStartedYourCareer,
            style: MintTextStyles.headline1,
          ),
          const SizedBox(height: 16),
          _DateOfExperience(
            experienceDate: experienceData.experience,
            noExperience: experienceData.noExperience,
            onDateChange: (experience) => onChange(
              experienceData.copyWith(experience: experience),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => onChange(
              experienceData.copyWith(
                noExperience: !experienceData.noExperience,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Checkbox(
                  value: experienceData.noExperience,
                  onChanged: (value) {
                    onChange(
                      experienceData.copyWith(
                        noExperience: !experienceData.noExperience,
                      ),
                    );
                  },
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
          ),
          const SizedBox(height: 16),
          Text(
            l10n.writeAboutYourBackgroundAndYourself,
            style: MintTextStyles.headline1,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(hintText: '${l10n.typeHere}...'),
            initialValue: experienceData.about,
            maxLines: 6,
          ),
          const SizedBox(height: 10),
          Text(
            l10n.writeAboutYourEducation,
            style: MintTextStyles.headline1,
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(hintText: '${l10n.typeHere}...'),
            initialValue: experienceData.education,
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}

class _DateOfExperience extends StatelessWidget {
  const _DateOfExperience({
    required this.noExperience,
    required this.experienceDate,
    required this.onDateChange,
  });

  final bool noExperience;
  final DateTime? experienceDate;
  final void Function(DateTime) onDateChange;

  Future<DateTime?> _showDatePicker(BuildContext context) {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 65),
      lastDate: now,
    );
  }

  @override
  Widget build(BuildContext context) {
    final date = experienceDate;
    return InkWell(
      onTap: !noExperience
          ? () async {
              final date = await _showDatePicker(context);
              if (date == null) return;
              onDateChange(date);
            }
          : null,
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
