import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/entity/patient_book/patient_book.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import 'consultation_status_widget.dart';

class PatientsPaginatedDataTable extends StatelessWidget {
  const PatientsPaginatedDataTable({required this.patientBookData, super.key});

  final List<PatientBook> patientBookData;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SelectionArea(
      child: PaginatedDataTable2(
        autoRowsToHeight: true,
        renderEmptyRowsInTheEnd: false,
        headingTextStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.3,
          letterSpacing: -0.01,
        ),
        dataRowHeight: 75,
        dataTextStyle: MintTextStyles.figure,
        minWidth: 900,
        wrapInCard: false,
        columns: <DataColumn>[
          const DataColumn2(
            label: Center(child: Text('#')),
            numeric: true,
            size: ColumnSize.S,
            fixedWidth: 120,
          ),
          DataColumn2(label: Text(l10n.fullName)),
          DataColumn2(
            label: Text(l10n.contactPhone),
            fixedWidth: 200,
          ),
          DataColumn2(label: Text(l10n.time)),
          DataColumn2(label: Text(l10n.date)),
          DataColumn2(label: Center(child: Text(l10n.status))),
        ],
        source: _BookingDataTableSource(context, patientBookData),
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

  String _getStatus(DateTime startTime, DateTime endTime) {
    final now = DateTime.now();
    final l10n = context.l10n;
    return startTime.isBefore(now)
        ? endTime.isAfter(now)
            ? l10n.current
            : l10n.completed
        : l10n.upcoming;
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
