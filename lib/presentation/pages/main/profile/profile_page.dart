import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_module.dart';

import '../../../../domain/entity/patient_book/patient_book.dart';
import '../../../../l10n/l10n.dart';
import '../../../bloc/patients/patients_bloc.dart';
import '../../../bloc/specialist_profile/specialist_profile_bloc.dart';
import '../../../widgets/mint_view_bar.dart';
import '../../../widgets/scrollable_area.dart';
import '../patients/widgets/patients_paginated_data_table.dart';
import 'widgets/profile_appointments_count.dart';
import 'widgets/specialist_data_widget.dart';

enum _ProfileAppointmentView { overview, recent, upcoming }

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SpecialistProfileBloc>(),
        ),
        BlocProvider(
          create: (context) =>
          getIt<PatientsBloc>()
            ..add(PatientsInitializeSubscriptionRequested()),
        ),
      ],
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView();

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  late _ProfileAppointmentView _selectedItem = _items(context).keys.first;

  Map<_ProfileAppointmentView, String> _items(BuildContext context) {
    final l10n = context.l10n;
    return {
      _ProfileAppointmentView.overview: l10n.overview,
      _ProfileAppointmentView.recent: l10n.recentConsultations,
      _ProfileAppointmentView.upcoming: l10n.upcomingAppointments,
    };
  }

  bool Function(PatientBook)? _whereBook(_ProfileAppointmentView view) {
    return switch (view) {
      _ProfileAppointmentView.overview => null,
      _ProfileAppointmentView.recent =>
          (book) => DateTime.now().isAfter(book.endTime),
      _ProfileAppointmentView.upcoming =>
          (book) => book.endTime.isAfter(DateTime.now()),
    };
  }

  @override
  Widget build(BuildContext context) {
    final items = _items(context);
    return ScrollableArea(
      child: Center(
        child: FractionallySizedBox(
          heightFactor: 0.95,
          widthFactor: 0.8,
          child: SelectionArea(
            child: Column(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: SpecialistDataWidget(),
                  ),
                ),
                const SizedBox(height: 30),
                const ProfileAppointmentsCount(),
                const SizedBox(height: 30),
                MintViewBar(
                  selectedView: _selectedItem,
                  viewItems: items.entries
                      .map((e) => MintViewBarItem(value: e.key, title: e.value))
                      .toList(),
                  onViewChange: (view) => setState(() => _selectedItem = view),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 450,
                  child: PatientsPaginatedDataTable(
                    rowsPerPage: 3,
                    title: Text(
                      context.l10n.appointments,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    whereBook: _whereBook(_selectedItem),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
