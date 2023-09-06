import 'package:flutter/material.dart';

extension TimeOfDayToString on TimeOfDay {
  String get hourToString => hour.toString().padLeft(2, '0');

  String get minuteToString => minute.toString().padLeft(2, '0');

  String get toTimeString => '$hourToString:$minuteToString';
}
