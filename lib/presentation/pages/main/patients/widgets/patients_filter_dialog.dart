import 'package:flutter/material.dart';

import '../../../../../backbone/consultation_status.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_container.dart';
import '../../../../widgets/popup_app_bar.dart';
import 'consultation_status_widget.dart';

class PatientsFilterDialog extends StatelessWidget {
  const PatientsFilterDialog({super.key, this.onClear, this.onApply});

  final VoidCallback? onClear;
  final VoidCallback? onApply;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Dialog(
      backgroundColor: MintColors.scaffold,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
                  _FilterAppBar(onClear: onClear),
                  const SizedBox(height: 24),
                  Text(l10n.date, style: MintTextStyles.medium16),
                  const SizedBox(height: 10),
                  MintContainer(
                    width: double.infinity,
                    child: Text(l10n.selectDate, style: MintTextStyles.hint),
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.status, style: MintTextStyles.medium16),
                  const SizedBox(height: 10),
                  _ConsultationStatusDropDown(
                    status: null,
                    onChanged: (status) {},
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: onApply,
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
