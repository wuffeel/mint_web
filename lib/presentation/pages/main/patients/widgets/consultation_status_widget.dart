import 'package:flutter/material.dart';

import '../../../../../backbone/consultation_status.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class ConsultationStatusWidget extends StatelessWidget {
  const ConsultationStatusWidget({required this.status, super.key});

  final String status;

  ConsultationStatus? get enumStatus {
    for (final status in ConsultationStatus.values) {
      if (status.name == this.status.toLowerCase()) return status;
    }
    return null;
  }

  Color _getStatusColor(ConsultationStatus? status) {
    if (status == null) return MintColors.scaffold;

    switch (status) {
      case ConsultationStatus.upcoming:
        return MintColors.upcomingStatus;
      case ConsultationStatus.completed:
        return MintColors.completedStatus;
      case ConsultationStatus.current:
        return MintColors.primaryBlueColor.withOpacity(0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: _getStatusColor(enumStatus),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Text(status, style: MintTextStyles.tagSmall),
      ),
    );
  }
}
