// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModelDto _$$_UserModelDtoFromJson(Map json) => _$_UserModelDto(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      photoUrl: json['photoUrl'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      dateOfBirth: DateUtils.tryConvertToDateTime(json['dateOfBirth']),
    );

Map<String, dynamic> _$$_UserModelDtoToJson(_$_UserModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };
