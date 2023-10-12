import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../domain/entity/patient_book/patient_book.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../bloc/patients/patients_bloc.dart';

enum _AppointmentCountEnum { today, week, month }

class ProfileAppointmentsCount extends StatelessWidget {
  const ProfileAppointmentsCount({super.key});

  int _getAppointmentCount(
    List<PatientBook>? bookList,
    _AppointmentCountEnum countType,
  ) {
    if (bookList == null) return 0;
    return bookList.where(_getAppointmentCondition(countType)).length;
  }

  bool Function(PatientBook) _getAppointmentCondition(
    _AppointmentCountEnum countType,
  ) {
    final now = DateTime.now();
    final todayDate = DateTime(now.year, now.month, now.day);

    bool isWithinToday(PatientBook p) {
      final tomorrowDate = todayDate.copyWith(day: now.day + 1);
      return p.bookTime.isAfter(todayDate) && p.bookTime.isBefore(tomorrowDate);
    }

    bool isWithinWeek(PatientBook p) {
      final firstDayOfWeek =
          todayDate.subtract(Duration(days: now.weekday - 1));
      // Next monday, 00:00.
      final lastDayOfWeek = todayDate.add(Duration(days: 8 - now.weekday));
      return p.bookTime.isAfter(firstDayOfWeek) &&
          p.bookTime.isBefore(lastDayOfWeek);
    }

    bool isWithinMonth(PatientBook e) {
      final startOfMonth = DateTime(now.year, now.month);
      // First day of next month, 00:00.
      final endOfMonth = DateTime(now.year, now.month + 1);
      return e.bookTime.isAfter(startOfMonth) &&
          e.bookTime.isBefore(endOfMonth);
    }

    return switch (countType) {
      _AppointmentCountEnum.today => isWithinToday,
      _AppointmentCountEnum.week => isWithinWeek,
      _AppointmentCountEnum.month => isWithinMonth,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PatientsBloc, PatientsState,
        PatientsFetchBookListSuccess?>(
      selector: (state) {
        return state is PatientsFetchBookListSuccess ? state : null;
      },
      builder: (context, state) {
        final l10n = context.l10n;
        final bookList = state?.bookList;
        return Row(
          children: <Widget>[
            Expanded(
              child: _AppointmentCountItem(
                icon: Icons.menu_book_outlined,
                count: _getAppointmentCount(
                  bookList,
                  _AppointmentCountEnum.today,
                ),
                content: l10n.todayAppointments,
              ),
            ),
            Expanded(
              child: _AppointmentCountItem(
                icon: Icons.library_add_check_outlined,
                count: _getAppointmentCount(
                  bookList,
                  _AppointmentCountEnum.week,
                ),
                content: l10n.weekAppointments,
              ),
            ),
            Expanded(
              child: _AppointmentCountItem(
                icon: Icons.bar_chart_outlined,
                count: _getAppointmentCount(
                  bookList,
                  _AppointmentCountEnum.month,
                ),
                content: l10n.monthAppointments,
              ),
            ),
          ]..insertBetween(const SizedBox(width: 50)),
        );
      },
    );
  }
}

class _AppointmentCountItem extends StatelessWidget {
  const _AppointmentCountItem({
    required this.icon,
    required this.count,
    required this.content,
  });

  final IconData icon;
  final int count;
  final String content;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PatientsBloc, PatientsState, bool>(
      selector: (state) => state is PatientsFetchBookListLoading,
      builder: (context, isLoading) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          !isLoading ? count.toString() : '--',
                          style: const TextStyle(fontSize: 32),
                        ),
                        Text(
                          content,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: MintColors.hintColor.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(icon, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
