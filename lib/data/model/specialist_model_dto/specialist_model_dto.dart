import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/date_time_utils.dart';

part 'specialist_model_dto.freezed.dart';

part 'specialist_model_dto.g.dart';

@freezed
class SpecialistModelDto with _$SpecialistModelDto {
  const factory SpecialistModelDto({
    required String id,
    required String firstName,
    required String lastName,
    required int price,
    @JsonKey(
      fromJson: DateTimeUtils.convertToDateTime,
      toJson: DateTimeUtils.dateTimeToJson,
    )
    required DateTime experience,
    required List<String> specializations,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    String? photoUrl,
    String? about,
    String? education,
  }) = _SpecialistModelDto;

  const SpecialistModelDto._();

  factory SpecialistModelDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialistModelDtoFromJson(json);

  Map<String, dynamic> toJsonWithoutId() => toJson()..remove('id');
}
