import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/date_time_utils.dart';

part 'user_model_dto.freezed.dart';

part 'user_model_dto.g.dart';

@freezed
class UserModelDto with _$UserModelDto {
  const factory UserModelDto({
    required String id,
    String? phoneNumber,
    String? photoUrl,
    String? firstName,
    String? lastName,
    String? email,
    @JsonKey(
      fromJson: DateTimeUtils.tryConvertToDateTime,
      toJson: DateTimeUtils.dateTimeToJson,
    )
    DateTime? dateOfBirth,
  }) = _UserModelDto;

  const UserModelDto._();

  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);

  factory UserModelDto.fromJsonWithId(Map<String, dynamic> json, String id) =>
      _$UserModelDtoFromJson(<String, dynamic>{'id': id, ...json});

  Map<String, dynamic> toJsonWithoutId() => toJson()..remove('id');
}
