// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpecialistModelDto _$$_SpecialistModelDtoFromJson(Map json) =>
    _$_SpecialistModelDto(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      price: json['price'] as int,
      experience: DateTime.parse(json['experience'] as String),
      specializations: (json['specializations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      photoUrl: json['photoUrl'] as String?,
      about: json['about'] as String?,
      education: json['education'] as String?,
    );

Map<String, dynamic> _$$_SpecialistModelDtoToJson(
        _$_SpecialistModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'price': instance.price,
      'experience': instance.experience.toIso8601String(),
      'specializations': instance.specializations,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'photoUrl': instance.photoUrl,
      'about': instance.about,
      'education': instance.education,
    };
