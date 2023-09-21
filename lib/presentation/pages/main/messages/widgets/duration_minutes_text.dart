import 'package:flutter/material.dart';

class DurationMinutesText extends StatelessWidget {
  const DurationMinutesText(
    this.duration, {
    required this.color,
    super.key,
  });

  final Duration duration;
  final Color color;

  String _getTimeDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getTimeDuration(duration),
      style: TextStyle(fontSize: 14, color: color),
    );
  }
}
