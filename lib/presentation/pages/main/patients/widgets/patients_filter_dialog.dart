import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../backbone/consultation_status.dart';
import '../../../../../domain/entity/patient_filter.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_container.dart';
import '../../../../widgets/popup_app_bar.dart';
import 'consultation_status_widget.dart';

class PatientsFilterDialog extends StatefulWidget {
  const PatientsFilterDialog({
    required this.filter,
    required this.onApply,
    required this.onClear,
    required this.minDate,
    required this.maxDate,
    required this.selectableDatePredicate,
    super.key,
  });

  final PatientFilter filter;
  final VoidCallback? onClear;
  final void Function(PatientFilter) onApply;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool Function(DateTime) selectableDatePredicate;

  @override
  State<PatientsFilterDialog> createState() => _PatientsFilterDialogState();
}

class _PatientsFilterDialogState extends State<PatientsFilterDialog> {
  late PatientFilter _filter = widget.filter;

  Future<void> _showDatePicker(
    DateTime minDate,
    DateTime maxDate,
    bool Function(DateTime) selectableDatePredicate,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: maxDate,
      firstDate: minDate,
      lastDate: maxDate,
      selectableDayPredicate: selectableDatePredicate,
    );
    if (date != null) {
      setState(() => _filter = _filter.copyWith(bookDate: date));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final minDate = widget.minDate;
    final maxDate = widget.maxDate;
    final selectedDate = _filter.bookDate;
    return Dialog(
      backgroundColor: MintColors.scaffold,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Wrap(
          children: [
            SizedBox(
              width: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 8),
                  _FilterAppBar(onClear: widget.onClear),
                  const SizedBox(height: 24),
                  Text(l10n.date, style: MintTextStyles.medium16),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: minDate != null && maxDate != null
                        ? () => _showDatePicker(
                              minDate,
                              maxDate,
                              widget.selectableDatePredicate,
                            )
                        : null,
                    child: MintContainer(
                      width: double.infinity,
                      child: Text(
                        selectedDate != null
                            ? DateFormat.yMd(l10n.localeName)
                                .format(selectedDate)
                            : l10n.selectDate,
                        style: selectedDate != null
                            ? MintTextStyles.body
                            : MintTextStyles.hint,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.status, style: MintTextStyles.medium16),
                  const SizedBox(height: 10),
                  _ConsultationStatusDropDown(
                    status: _filter.status,
                    onChanged: (status) => setState(
                      () => _filter = _filter.copyWith(status: status),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => widget.onApply(_filter),
                    child: Text(l10n.apply),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterAppBar extends StatelessWidget {
  const _FilterAppBar({required this.onClear});

  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopupAppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        l10n.filter,
        style: const TextStyle(
          fontSize: 18,
          height: 1.1,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onClear,
          child: Text(
            l10n.clear,
            style: const TextStyle(
              fontSize: 16,
              color: MintColors.lightGrey,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConsultationStatusDropDown extends StatelessWidget {
  const _ConsultationStatusDropDown({required this.onChanged, this.status});

  final ConsultationStatus? status;
  final void Function(ConsultationStatus?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: MintContainer(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButton<ConsultationStatus?>(
          dropdownColor: Colors.white,
          icon: Assets.svg.arrowDown.svg(
            width: 24,
            height: 24,
            fit: BoxFit.scaleDown,
            colorFilter: const ColorFilter.mode(
              MintColors.lightGrey,
              BlendMode.srcIn,
            ),
          ),
          iconEnabledColor: MintColors.lightGrey,
          items: const [
            DropdownMenuItem(child: Text('')),
            DropdownMenuItem(
              value: ConsultationStatus.upcoming,
              child: ConsultationStatusWidget(
                status: ConsultationStatus.upcoming,
              ),
            ),
            DropdownMenuItem(
              value: ConsultationStatus.completed,
              child: ConsultationStatusWidget(
                status: ConsultationStatus.completed,
              ),
            ),
            DropdownMenuItem(
              value: ConsultationStatus.current,
              child: ConsultationStatusWidget(
                status: ConsultationStatus.current,
              ),
            ),
          ],
          hint: Text(
            context.l10n.selectStatus,
            style: MintTextStyles.hint,
          ),
          onChanged: onChanged,
          value: status,
        ),
      ),
    );
  }
}
