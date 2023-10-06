import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../bloc/specialist_info/specialist_info_bloc.dart';
import '../../../../bloc/specialist_profile/specialist_profile_bloc.dart';
import 'specialist_personal_data.dart';

class SpecialistEditWidget extends StatelessWidget {
  const SpecialistEditWidget(
    this.infoEnum, {
    required this.specialist,
    required this.user,
    required this.specializations,
    super.key,
  });

  final SpecialistInfoEnum infoEnum;
  final SpecialistModel specialist;
  final UserModel user;
  final List<String>? specializations;

  @override
  Widget build(BuildContext context) {
    return switch (infoEnum) {
      SpecialistInfoEnum.specialities =>
        const Text('Placeholder', style: TextStyle(fontSize: 16)),
      SpecialistInfoEnum.phone =>
        Text(user.phoneNumber ?? '', style: const TextStyle(fontSize: 16)),
      SpecialistInfoEnum.email => _SpecialistEmail(user: user),
      SpecialistInfoEnum.experience =>
        _SpecialistExperience(specialist: specialist),
      SpecialistInfoEnum.price =>
        const Text('Placeholder', style: TextStyle(fontSize: 16)),
    };
  }
}

class _SpecialistEmail extends StatelessWidget {
  const _SpecialistEmail({required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        isCollapsed: true,
        isDense: true,
      ),
      initialValue: user.email,
      onChanged: (text) => context.read<SpecialistProfileBloc>().add(
            SpecialistProfileEditInfoChanged(user: user.copyWith(email: text)),
          ),
      style: const TextStyle(fontSize: 16),
    );
  }
}

class _SpecialistExperience extends StatelessWidget {
  const _SpecialistExperience({required this.specialist});

  final SpecialistModel specialist;

  Future<void> _showDatePicker(BuildContext context) async {
    final now = DateTime.now();
    await showDatePicker(
      context: context,
      initialDate: specialist.experience,
      firstDate: DateTime(now.year - 65, now.month, now.day),
      lastDate: now,
    ).then(
      (date) => date != null
          ? context.read<SpecialistProfileBloc>().add(
                SpecialistProfileEditInfoChanged(
                  specialist: specialist.copyWith(experience: date),
                ),
              )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDatePicker(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          DateFormat.yMd(context.l10n.localeName).format(specialist.experience),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
