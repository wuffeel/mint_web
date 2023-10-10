// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_profile_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpecialistProfileModelDto _$$_SpecialistProfileModelDtoFromJson(Map json) =>
    _$_SpecialistProfileModelDto(
      id: json['id'] as String,
      experience: const DateTimeConverter().fromJson(json['experience']),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      price: json['price'] as int,
      specializations: (json['specializations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      about: json['about'] as String?,
      education: json['education'] as String?,
    );

Map<String, dynamic> _$$_SpecialistProfileModelDtoToJson(
        _$_SpecialistProfileModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'experience': const DateTimeConverter().toJson(instance.experience),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'price': instance.price,
      'specializations': instance.specializations,
      'about': instance.about,
      'education': instance.education,
    };
