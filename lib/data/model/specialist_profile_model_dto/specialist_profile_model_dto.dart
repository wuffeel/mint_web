import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint_core/mint_utils.dart';

part 'specialist_profile_model_dto.freezed.dart';

part 'specialist_profile_model_dto.g.dart';

@freezed
class SpecialistProfileModelDto with _$SpecialistProfileModelDto {
  const factory SpecialistProfileModelDto({
    required String id,
    @DateTimeConverter() required DateTime experience,
    required String firstName,
    required String lastName,
    required int price,
    required List<String> specializations,
    String? about,
    String? education,
  }) = _SpecialistProfileModelDto;

  const SpecialistProfileModelDto._();

  factory SpecialistProfileModelDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialistProfileModelDtoFromJson(json);

  factory SpecialistProfileModelDto.fromJsonWithId(
    Map<String, dynamic> json,
    String id,
  ) =>
      _$SpecialistProfileModelDtoFromJson(<String, dynamic>{'id': id, ...json});

  Map<String, dynamic> toJsonWithoutId() => toJson()..remove('id');
}
