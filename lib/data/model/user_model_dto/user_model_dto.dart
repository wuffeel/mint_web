import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/date_utils.dart';

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
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: DateUtils.tryConvertToDateTime) DateTime? dateOfBirth,
  }) = _UserModelDto;

  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);

  factory UserModelDto.fromJsonWithId(Map<String, dynamic> json, String id) =>
      _$UserModelDtoFromJson(<String, dynamic>{'id': id, ...json});
}
