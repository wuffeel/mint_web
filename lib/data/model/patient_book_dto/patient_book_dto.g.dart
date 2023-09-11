// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientBookDto _$$_PatientBookDtoFromJson(Map json) => _$_PatientBookDto(
      id: json['id'] as String,
      bookTime: const DateTimeConverter().fromJson(json['bookTime']),
      durationMinutes: json['durationMinutes'] as int,
      endTime: const DateTimeConverter().fromJson(json['endTime']),
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$_PatientBookDtoToJson(_$_PatientBookDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookTime': const DateTimeConverter().toJson(instance.bookTime),
      'durationMinutes': instance.durationMinutes,
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
