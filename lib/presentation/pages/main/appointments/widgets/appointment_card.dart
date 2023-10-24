import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    required this.details,
    required this.isFocused,
    super.key,
  });

  final CalendarAppointmentDetails details;
  final bool isFocused;

  /// Width value for card to be considered as 'wide'
  static const _wideTileWidth = 250;

  /// Height value for card to be considered as 'big'
  static const _bigCardHeight = 50;

  bool _isWideCard(double width) {
    return width > _wideTileWidth;
  }

  bool _isBigCard(double height) {
    return height > _bigCardHeight;
  }

  @override
  Widget build(BuildContext context) {
    if (details.appointments.isEmpty) return const SizedBox.shrink();
    final appointment = details.appointments.first as Appointment;
    final notes = appointment.notes;
    final hasNotes = notes != null && notes.isNotEmpty;

    final isWideCard = _isWideCard(details.bounds.width);
    final isBigCard = _isBigCard(details.bounds.height);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: !isFocused
            ? Colors.white
            : MintColors.primaryBlueColor.withOpacity(0.12),
      ),
      child: SizedBox(
        height: details.bounds.height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 3,
              height: double.infinity,
              color: MintColors.primaryBlueColor,
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (isBigCard)
                    _AppointmentDetails(appointment: appointment)
                  else
                    Row(
                      children: <Widget>[
                        _AppointmentDetails(appointment: appointment),
                        if (!isBigCard) ...[
                          if (isWideCard)
                            const SizedBox(width: 8)
                          else
                            const Spacer(),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ],
                    ),
                  if (hasNotes && isBigCard) ...[
                    const SizedBox(height: 4),
                    Text(
                      notes,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: MintTextStyles.gilroy.copyWith(
                        fontSize: 12,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppointmentDetails extends StatelessWidget {
  const _AppointmentDetails({required this.appointment});

  final Appointment appointment;

  String _getBookScheduleByLocale(
    BuildContext context,
    DateTime startTime,
    DateTime endTime,
  ) {
    final is24HourFormat = MediaQuery.of(context).alwaysUse24HourFormat;

    final format = is24HourFormat ? 'HH:mm' : 'h:mm a';
    final formatter = DateFormat(format, context.l10n.localeName);

    final formattedStart = formatter.format(startTime);
    final formattedEnd = formatter.format(endTime);

    return '$formattedStart - $formattedEnd';
  }

  @override
  Widget build(BuildContext context) {
    final notes = appointment.notes;
    final hasNotes = notes != null && notes.isNotEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          appointment.subject,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
        ),
        if (!hasNotes) const SizedBox(height: 4),
        Text(
          _getBookScheduleByLocale(
            context,
            appointment.startTime,
            appointment.endTime,
          ),
          style: MintTextStyles.gilroy.copyWith(
            fontSize: 10,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
