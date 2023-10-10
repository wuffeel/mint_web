import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../backbone/specialist_info_group.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../utils/numeric_pattern_input_formatter.dart';
import '../../../../../utils/validation_util.dart';
import '../../../../bloc/specialist_profile/specialist_profile_bloc.dart';
import 'edit_text_field.dart';

class SpecialistEditWidget extends StatelessWidget {
  const SpecialistEditWidget(
    this.infoEnum, {
    required this.specialist,
    required this.user,
    required this.currentSpecializations,
    required this.availableSpecializations,
    super.key,
  });

  final SpecialistInfoGroup infoEnum;
  final SpecialistModel specialist;
  final UserModel user;
  final List<String?> currentSpecializations;
  final List<String>? availableSpecializations;

  @override
  Widget build(BuildContext context) {
    return switch (infoEnum) {
      SpecialistInfoGroup.specialities => _SpecialistSpecializations(
          currentSpecializations,
          availableSpecializations,
        ),
      SpecialistInfoGroup.phone =>
        Text(user.phoneNumber ?? '', style: const TextStyle(fontSize: 16)),
      SpecialistInfoGroup.email => _SpecialistEmail(user),
      SpecialistInfoGroup.dateOfBirth => _SpecialistDateOfBirth(user),
      SpecialistInfoGroup.experience => _SpecialistExperience(specialist),
      SpecialistInfoGroup.price => _SpecialistPrice(specialist),
    };
  }
}

/// Specializations items edit widget.
///
/// Displays [currentSpecializations] tiles with delete option. Also has 'add'
/// button to insert new specializations from [availableSpecializations] list.
class _SpecialistSpecializations extends StatelessWidget {
  const _SpecialistSpecializations(
    this.currentSpecializations,
    this.availableSpecializations,
  );

  final List<String?> currentSpecializations;
  final List<String>? availableSpecializations;

  void _onSpecializationRemove(BuildContext context, int index) {
    final removeEvent = SpecialistProfileEditInfoChanged(
      currentSpecializations: currentSpecializations..removeAt(index),
    );
    context.read<SpecialistProfileBloc>().add(removeEvent);
  }

  @override
  Widget build(BuildContext context) {
    final specializations = currentSpecializations;
    final availableSpecializations = this
        .availableSpecializations
        ?.where((specialization) => !specializations.contains(specialization))
        .toList();
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: List.generate(
          specializations.last == null ||
                  (availableSpecializations?.isEmpty ?? false)
              ? specializations.length
              : specializations.length + 1, (index) {
        if (index == specializations.length) {
          return _AddSpecializationButton(specializations);
        } else {
          final specialization = specializations[index];
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: _editContainerShadow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (specialization != null)
                    Text(
                      specialization,
                      style: const TextStyle(fontSize: 16),
                    )
                  else
                    _SpecializationsDropdown(
                      specializations,
                      availableSpecializations,
                    ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () => _onSpecializationRemove(context, index),
                    child: const Icon(Icons.cancel, size: 14),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

/// Specialist email edit widget. Uses [EditTextField]
class _SpecialistEmail extends StatelessWidget {
  const _SpecialistEmail(this.user);

  final UserModel user;

  void _onEmailChange(BuildContext context, String email) {
    final changeEvent = SpecialistProfileEditInfoChanged(
      user: user.copyWith(email: email),
    );
    context.read<SpecialistProfileBloc>().add(changeEvent);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: EditTextField(
        initialValue: user.email,
        onChanged: (email) => _onEmailChange(context, email),
        validator: (value) => ValidationUtil.emailValidator(context, value),
      ),
    );
  }
}

/// Specialist date of birth edit widget. Uses [showDatePicker].
class _SpecialistDateOfBirth extends StatelessWidget {
  const _SpecialistDateOfBirth(this.user);

  final UserModel user;

  Future<void> _showDatePicker(
    BuildContext context,
    DateTime? initialDate,
  ) async {
    final now = DateTime.now();
    final maxDate = DateTime(now.year - 18, now.month, now.day);
    await showDatePicker(
      context: context,
      initialDate: initialDate ?? maxDate,
      firstDate: DateTime(now.year - 65, now.month, now.day),
      lastDate: maxDate,
    ).then(
      (date) {
        if (date == null) return;
        final changeEvent = SpecialistProfileEditInfoChanged(
          user: user.copyWith(dateOfBirth: date),
        );
        return context.read<SpecialistProfileBloc>().add(changeEvent);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final dateOfBirth = user.dateOfBirth;
    return _DatePickerContainer(
      date: dateOfBirth,
      dateFormat: DateFormat.yMMMMd(context.l10n.localeName),
      onTap: () => _showDatePicker(context, dateOfBirth),
    );
  }
}

/// Specialist experience edit widget. Uses [showDatePicker].
class _SpecialistExperience extends StatelessWidget {
  const _SpecialistExperience(this.specialist);

  final SpecialistModel specialist;

  Future<void> _showDatePicker(
    BuildContext context,
    DateTime initialDate,
  ) async {
    final now = DateTime.now();
    await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(now.year - 65, now.month, now.day),
      lastDate: now,
    ).then(
      (date) {
        if (date == null) return;
        final changeEvent = SpecialistProfileEditInfoChanged(
          specialist: specialist.copyWith(experience: date),
        );
        return context.read<SpecialistProfileBloc>().add(changeEvent);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final experience = specialist.experience;
    return _DatePickerContainer(
      date: specialist.experience,
      onTap: () => _showDatePicker(context, experience),
    );
  }
}

/// Specialist price edit widget. Uses [EditTextField].
class _SpecialistPrice extends StatelessWidget {
  const _SpecialistPrice(this.specialist);

  final SpecialistModel specialist;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text('₴', style: TextStyle(fontSize: 16)),
        SizedBox(
          width: 75,
          child: EditTextField(
            initialValue: specialist.price.toString(),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              NumericPatternInputFormatter(),
            ],
            onChanged: (price) => context.read<SpecialistProfileBloc>().add(
                  SpecialistProfileEditInfoChanged(
                    specialist: specialist.copyWith(
                      price: price.isNotEmpty ? int.parse(price) : 0,
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}

/// Material container with [date] formatted to text.
///
/// [onTap] callback should call [showDatePicker].
class _DatePickerContainer extends StatelessWidget {
  const _DatePickerContainer({
    required this.date,
    required this.onTap,
    this.dateFormat,
  });

  final DateTime? date;
  final VoidCallback onTap;
  final DateFormat? dateFormat;

  @override
  Widget build(BuildContext context) {
    final date = this.date;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: _editContainerShadow,
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(
          date != null
              ? (dateFormat ?? DateFormat.yMd(context.l10n.localeName))
                  .format(date)
              : '',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

/// Displays 'add' button for new specializations. If available specializations
/// list has not been loaded yet, the circular progress indicator will be
/// displayed.
class _AddSpecializationButton extends StatelessWidget {
  const _AddSpecializationButton(this.currentSpecializations);

  final List<String?> currentSpecializations;

  void _onSpecializationAdd(BuildContext context) {
    final changeEvent = SpecialistProfileEditInfoChanged(
      currentSpecializations: [
        ...currentSpecializations,
        null,
      ],
    );
    return context.read<SpecialistProfileBloc>().add(changeEvent);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SpecialistProfileBloc, SpecialistProfileState, bool>(
      selector: (state) => state is SpecialistProfileSpecializationsLoading,
      builder: (context, isSpecializationsLoading) {
        return isSpecializationsLoading
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : MaterialButton(
                onPressed: () => _onSpecializationAdd(context),
                color: Theme.of(context).scaffoldBackgroundColor,
                minWidth: 0,
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
              );
      },
    );
  }
}

/// Dropdown for [availableSpecializations]. Dropdown items are only ones that
/// not in [currentSpecializations] list.
class _SpecializationsDropdown extends StatelessWidget {
  const _SpecializationsDropdown(
    this.currentSpecializations,
    this.availableSpecializations,
  );

  final List<String?> currentSpecializations;
  final List<String>? availableSpecializations;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        items: (availableSpecializations ?? [])
            .map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        isDense: true,
        hint: Text(
          context.l10n.specialization,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).hintColor.withOpacity(0.6),
          ),
        ),
        style: const TextStyle(fontSize: 16),
        onChanged: (e) => e != null
            ? context.read<SpecialistProfileBloc>().add(
                  SpecialistProfileEditInfoChanged(
                    currentSpecializations: currentSpecializations..last = e,
                  ),
                )
            : null,
      ),
    );
  }
}

/// Default elevation used for widgets on page.
List<BoxShadow> get _editContainerShadow => [
      BoxShadow(
        blurRadius: 2,
        color: Colors.black.withOpacity(0.3),
      ),
    ];
