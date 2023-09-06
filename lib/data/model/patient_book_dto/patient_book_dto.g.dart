// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientBookDto _$$_PatientBookDtoFromJson(Map json) => _$_PatientBookDto(
      id: json['id'] as String,
      bookTime: DateTime.parse(json['bookTime'] as String),
      durationMinutes: json['durationMinutes'] as int,
      endTime: DateTime.parse(json['endTime'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$_PatientBookDtoToJson(_$_PatientBookDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookTime': instance.bookTime.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'endTime': instance.endTime.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
