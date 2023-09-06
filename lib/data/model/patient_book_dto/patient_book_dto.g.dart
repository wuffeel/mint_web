// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatientBookDto _$$_PatientBookDtoFromJson(Map json) => _$_PatientBookDto(
      id: json['id'] as String,
      bookTime: DateTimeUtils.convertToDateTime(json['bookTime']),
      durationMinutes: json['durationMinutes'] as int,
      endTime: DateTimeUtils.convertToDateTime(json['endTime']),
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$_PatientBookDtoToJson(_$_PatientBookDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookTime': DateTimeUtils.dateTimeToJson(instance.bookTime),
      'durationMinutes': instance.durationMinutes,
      'endTime': DateTimeUtils.dateTimeToJson(instance.endTime),
      'phoneNumber': instance.phoneNumber,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
