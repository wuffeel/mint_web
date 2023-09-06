import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/patient_book/patient_book.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../injector/injector.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/mint_text_styles.dart';
import '../../../bloc/patients/patients_bloc.dart';
import 'widgets/patients_filter_dialog.dart';
import 'widgets/patients_paginated_data_table.dart';

@RoutePage()
class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PatientsBloc>(),
      child: const _PatientsView(),
    );
  }
}


class _PatientsView extends StatelessWidget {
  const _PatientsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.83,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 36),
              const _PatientsToolbar(),
              const SizedBox(height: 16),
              Flexible(
                child: PatientsPaginatedDataTable(
                  patientBookData: <PatientBook>[
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 14, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 15, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                    PatientBook(
                      id: '',
                      bookTime: DateTime(2023, 9, 5, 10, 30),
                      durationMinutes: 60,
                      endTime: DateTime(2023, 9, 5, 11, 30),
                      phoneNumber: '+380123321123',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 65),
            ],
          ),
        ),
      ),
    );
  }
}

class _PatientsToolbar extends StatelessWidget {
  const _PatientsToolbar();

  void _showFilterDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<PatientsBloc>(),
        child: PatientsFilterDialog(onApply: () {}, onClear: () {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          l10n.patientsList,
          style: MintTextStyles.body.copyWith(fontSize: 24),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: l10n.search,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(width: 24),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Assets.svg.sortIcon.svg(
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).iconTheme.color ?? Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(l10n.sort, style: MintTextStyles.tagBig),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () => _showFilterDialog(context),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Assets.svg.filterIcon.svg(
                        width: 16,
                        height: 16,
                        fit: BoxFit.scaleDown,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color ?? Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(l10n.filter, style: MintTextStyles.tagBig),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
