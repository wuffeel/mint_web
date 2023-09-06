import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/date_time_utils.dart';

part 'patient_book_dto.freezed.dart';

part 'patient_book_dto.g.dart';

@freezed
class PatientBookDto with _$PatientBookDto {
  const factory PatientBookDto({
    required String id,
    @JsonKey(
      fromJson: DateTimeUtils.convertToDateTime,
      toJson: DateTimeUtils.dateTimeToJson,
    )
    required DateTime bookTime,
    required int durationMinutes,
    @JsonKey(
      fromJson: DateTimeUtils.convertToDateTime,
      toJson: DateTimeUtils.dateTimeToJson,
    )
    required DateTime endTime,
    String? phoneNumber,
    String? firstName,
    String? lastName,
  }) = _PatientBookDto;

  factory PatientBookDto.fromJson(Map<String, dynamic> json) =>
      _$PatientBookDtoFromJson(json);

  factory PatientBookDto.fromJsonWithId(Map<String, dynamic> json, String id) =>
      _$PatientBookDtoFromJson(<String, dynamic>{'id': id, ...json});
}
