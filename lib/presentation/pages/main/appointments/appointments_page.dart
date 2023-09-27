import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_module.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../bloc/appointments/appointments_bloc.dart';
import '../../../widgets/error_try_again.dart';
import 'widgets/appointments_calendar.dart';
import 'widgets/appointments_view_bar.dart';

@RoutePage()
class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppointmentsBloc>()
        ..add(AppointmentsInitializeSubscriptionRequested()),
      child: const _AppointmentsView(),
    );
  }
}

class _AppointmentsView extends StatefulWidget {
  const _AppointmentsView();

  @override
  State<_AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<_AppointmentsView> {
  /// Variable that stores date that was tapped
  DateTime? _focusedDate;

  final _calendarController = CalendarController()..view = CalendarView.month;

  Future<bool> rebuild() async {
    if (!mounted) return false;

    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return false;
    }

    setState(() {});
    return true;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calendarController.addPropertyChangedListener((_) {
        _doRebuild();
      });
    });
  }

  /// Function that does rebuild with setState() only if build is done
  Future<bool> _doRebuild() async {
    if (!mounted) return false;

    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return false;
    }

    setState(() {});
    return true;
  }

  void _onFocusedDateChange(DateTime date) {
    setState(() => _focusedDate = date);
  }

  void _onTryAgain() {
    context.read<AppointmentsBloc>().add(AppointmentsTryAgainRequested());
  }

  @override
  void dispose() {
    _calendarController
      ..removePropertyChangedListener((_) => _doRebuild())
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.83,
          child: BlocBuilder<AppointmentsBloc, AppointmentsState>(
            builder: (context, state) {
              if (state.isAppointmentsFailure || state.isBlackoutDatesFailure) {
                return Center(child: ErrorTryAgain(onRefresh: _onTryAgain));
              }
              return Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  AppointmentsViewBar(
                    view: _calendarController.view,
                    onViewChange: (view) => _calendarController.view = view,
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: _BlackoutDatesLoadingWrapper(
                      state: state,
                      child: AppointmentsCalendar(
                        controller: _calendarController,
                        bookingList: state.bookingList,
                        blackoutDates: state.blackoutDates,
                        focusedDate: _focusedDate,
                        onFocusedDateChange: _onFocusedDateChange,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BlackoutDatesLoadingWrapper extends StatelessWidget {
  const _BlackoutDatesLoadingWrapper({
    required this.state,
    required this.child,
  });

  final AppointmentsState state;
  final Widget child;

  static const double _appointmentsHeaderHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (state.isBlackoutDatesLoading || state.isAppointmentsLoading)
          Positioned.fill(
            top: _appointmentsHeaderHeight,
            child: ColoredBox(
              color: Colors.black.withOpacity(0.08),
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}
