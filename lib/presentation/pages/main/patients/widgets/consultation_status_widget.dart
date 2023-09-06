import 'package:flutter/material.dart';

import '../../../../../backbone/consultation_status.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';

class ConsultationStatusWidget extends StatelessWidget {
  const ConsultationStatusWidget({required this.status, super.key});

  final ConsultationStatus status;

  Color _getStatusColor(ConsultationStatus status) {
    switch (status) {
      case ConsultationStatus.upcoming:
        return MintColors.upcomingStatus;
      case ConsultationStatus.completed:
        return MintColors.completedStatus;
      case ConsultationStatus.current:
        return MintColors.primaryBlueColor.withOpacity(0.5);
    }
  }

  String _getStatusTitle(BuildContext context, ConsultationStatus status) {
    final l10n = context.l10n;
    switch (status) {
      case ConsultationStatus.upcoming:
        return l10n.upcoming;
      case ConsultationStatus.completed:
        return l10n.completed;
      case ConsultationStatus.current:
        return l10n.current;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _getStatusColor(status),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Text(
          _getStatusTitle(context, status),
          style: MintTextStyles.tagSmall,
        ),
      ),
    );
  }
}
