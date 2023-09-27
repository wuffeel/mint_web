import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:intl/intl.dart';

import '../../../../../backbone/consultation_status.dart';
import '../../../../../domain/entity/patient_book/patient_book.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../bloc/patients/patients_bloc.dart';
import '../../../../widgets/error_try_again.dart';
import 'consultation_status_widget.dart';

class PatientsPaginatedDataTable extends StatefulWidget {
  const PatientsPaginatedDataTable({super.key});

  @override
  State<PatientsPaginatedDataTable> createState() =>
      _PatientsPaginatedDataTableState();
}

class _PatientsPaginatedDataTableState
    extends State<PatientsPaginatedDataTable> {
  bool _sortAscending = true;
  int? _sortColumnIndex;

  void _sort<T>(
    Comparable<T> Function(PatientBook p) getField,
    int columnIndex,
    bool ascending,
  ) {
    final sortEvent = PatientsSortRequested(
      getField: getField,
      ascending: ascending,
    );
    context.read<PatientsBloc>().add(sortEvent);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  void _clearSort() {
    context.read<PatientsBloc>().add(PatientsSortRequested<void>());
    setState(() => _sortColumnIndex = null);
  }

  void _onRefresh() {
    context.read<PatientsBloc>().add(PatientsFetchBookListRequested());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SelectionArea(
      child: BlocBuilder<PatientsBloc, PatientsState>(
        builder: (context, state) {
          if (state is PatientsFetchBookListFailure) {
            return Center(child: ErrorTryAgain(onRefresh: _onRefresh));
          }
          if (state is PatientsBookListLoadSuccess) {
            return Theme(
              data: ThemeData(
                scrollbarTheme: ScrollbarThemeData(
                  thickness: MaterialStateProperty.all(5),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              ),
              child: _PatientsListLoadingWrapper(
                state: state,
                child: PaginatedDataTable2(
                  actions: <Widget>[
                    if (_sortColumnIndex != null)
                      TextButton(
                        onPressed: _clearSort,
                        child: Text(l10n.resetSorting),
                      ),
                  ],
                  empty: const _NoConsultationsFound(),
                  renderEmptyRowsInTheEnd: false,
                  headingTextStyle: MintTextStyles.medium16.copyWith(
                    height: 1.3,
                  ),
                  header: const Text(''),
                  dataRowHeight: 75,
                  dataTextStyle: MintTextStyles.figure.copyWith(
                    color: MintColors.dark,
                  ),
                  minWidth: 900,
                  rowsPerPage: state.rowsLimit,
                  columns: <DataColumn>[
                    const DataColumn2(
                      label: Center(child: Text('#')),
                      numeric: true,
                      size: ColumnSize.S,
                      fixedWidth: 120,
                    ),
                    DataColumn2(label: Text(l10n.fullName), size: ColumnSize.L),
                    DataColumn2(
                      label: Text(l10n.contactPhone),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text(l10n.time),
                    ),
                    DataColumn2(
                      label: Text(l10n.date),
                      onSort: (columnIndex, ascending) => _sort(
                        (p) => p.bookTime,
                        columnIndex,
                        ascending,
                      ),
                    ),
                    DataColumn2(
                      label: Center(child: Text(l10n.status)),
                    ),
                  ],
                  sortAscending: _sortAscending,
                  sortColumnIndex: _sortColumnIndex,
                  source: _BookingDataTableSource(
                    context,
                    state.filter.isEmpty
                        ? state.bookList
                        : state.filteredBookList,
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _BookingDataTableSource extends DataTableSource {
  _BookingDataTableSource(this.context, this.patientBookList);

  final BuildContext context;
  final List<PatientBook> patientBookList;

  String _formatPhone(String phone) => formatAsPhoneNumber(phone) ?? phone;

  String _getFullName(String? firstName, String? lastName) {
    return firstName == null || lastName == null
        ? context.l10n.patient
        : '$firstName $lastName';
  }

  String _getDurationTime(
    DateTime startTime,
    DateTime endTime, [
    String locale = 'en_US',
  ]) {
    final startStr = DateFormat.Hm(locale).format(startTime);
    final endStr = DateFormat.Hm(locale).format(endTime);
    return '$startStr-$endStr';
  }

  ConsultationStatus _getStatus(DateTime startTime, DateTime endTime) {
    final now = DateTime.now();
    return startTime.isBefore(now)
        ? endTime.isAfter(now)
            ? ConsultationStatus.current
            : ConsultationStatus.completed
        : ConsultationStatus.upcoming;
  }

  @override
  DataRow? getRow(int index) {
    final locale = context.l10n.localeName;

    final patientBook = patientBookList[index];
    final fullName = _getFullName(patientBook.firstName, patientBook.lastName);
    final bookTime = patientBook.bookTime;
    final bookEndTime = patientBook.endTime;

    final status = ConsultationStatusWidget(
      status: _getStatus(bookTime, bookEndTime),
    );

    return DataRow2.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Center(child: Text('${index + 1}'))),
        DataCell(Text(fullName)),
        DataCell(Text(_formatPhone(patientBook.phoneNumber ?? ''))),
        DataCell(Text(_getDurationTime(bookTime, bookEndTime, locale))),
        DataCell(Text(DateFormat.yMd(locale).format(bookTime))),
        DataCell(Center(child: status)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => patientBookList.length;

  @override
  int get selectedRowCount => 0;
}

class _NoConsultationsFound extends StatelessWidget {
  const _NoConsultationsFound();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n.noConsultationsFound,
        style: MintTextStyles.title,
      ),
    );
  }
}

class _PatientsListLoadingWrapper extends StatelessWidget {
  const _PatientsListLoadingWrapper({required this.state, required this.child});

  final PatientsState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    return state is PatientsFetchBookListLoading
        ? Stack(
            children: <Widget>[
              child,
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black.withOpacity(0.08),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          )
        : child;
  }
}
