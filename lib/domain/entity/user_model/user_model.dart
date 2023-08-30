import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    String? phoneNumber,
    String? photoUrl,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? dateOfBirth,
  }) = _UserModel;
}
