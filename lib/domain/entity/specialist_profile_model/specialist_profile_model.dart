import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialist_profile_model.freezed.dart';

@freezed
class SpecialistProfileModel with _$SpecialistProfileModel {
  const factory SpecialistProfileModel({
    required String id,
    required DateTime experience,
    required String firstName,
    required String lastName,
    required int price,
    required List<String> specializations,
    String? about,
    String? education,
    String? photoUrl,
  }) = _SpecialistProfileModel;

  const SpecialistProfileModel._();

  String? get fullName => '$firstName $lastName';
}
