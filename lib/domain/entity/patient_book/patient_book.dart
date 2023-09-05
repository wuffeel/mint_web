import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_book.freezed.dart';

@freezed
class PatientBook with _$PatientBook {
  const factory PatientBook({
    required String id,
    required DateTime bookTime,
    required int durationMinutes,
    required DateTime endTime,
    String? phoneNumber,
    String? firstName,
    String? lastName,
}) = _PatientBook;
}
