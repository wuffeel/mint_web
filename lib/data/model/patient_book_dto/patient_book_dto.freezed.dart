// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_book_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PatientBookDto _$PatientBookDtoFromJson(Map<String, dynamic> json) {
  return _PatientBookDto.fromJson(json);
}

/// @nodoc
mixin _$PatientBookDto {
  String get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get bookTime => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get endTime => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientBookDtoCopyWith<PatientBookDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientBookDtoCopyWith<$Res> {
  factory $PatientBookDtoCopyWith(
          PatientBookDto value, $Res Function(PatientBookDto) then) =
      _$PatientBookDtoCopyWithImpl<$Res, PatientBookDto>;
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime bookTime,
      int durationMinutes,
      @DateTimeConverter() DateTime endTime,
      String? phoneNumber,
      String? firstName,
      String? lastName});
}

/// @nodoc
class _$PatientBookDtoCopyWithImpl<$Res, $Val extends PatientBookDto>
    implements $PatientBookDtoCopyWith<$Res> {
  _$PatientBookDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookTime = null,
    Object? durationMinutes = null,
    Object? endTime = null,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookTime: null == bookTime
          ? _value.bookTime
          : bookTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientBookDtoCopyWith<$Res>
    implements $PatientBookDtoCopyWith<$Res> {
  factory _$$_PatientBookDtoCopyWith(
          _$_PatientBookDto value, $Res Function(_$_PatientBookDto) then) =
      __$$_PatientBookDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime bookTime,
      int durationMinutes,
      @DateTimeConverter() DateTime endTime,
      String? phoneNumber,
      String? firstName,
      String? lastName});
}

/// @nodoc
class __$$_PatientBookDtoCopyWithImpl<$Res>
    extends _$PatientBookDtoCopyWithImpl<$Res, _$_PatientBookDto>
    implements _$$_PatientBookDtoCopyWith<$Res> {
  __$$_PatientBookDtoCopyWithImpl(
      _$_PatientBookDto _value, $Res Function(_$_PatientBookDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookTime = null,
    Object? durationMinutes = null,
    Object? endTime = null,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$_PatientBookDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookTime: null == bookTime
          ? _value.bookTime
          : bookTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PatientBookDto
    with DiagnosticableTreeMixin
    implements _PatientBookDto {
  const _$_PatientBookDto(
      {required this.id,
      @DateTimeConverter() required this.bookTime,
      required this.durationMinutes,
      @DateTimeConverter() required this.endTime,
      this.phoneNumber,
      this.firstName,
      this.lastName});

  factory _$_PatientBookDto.fromJson(Map<String, dynamic> json) =>
      _$$_PatientBookDtoFromJson(json);

  @override
  final String id;
  @override
  @DateTimeConverter()
  final DateTime bookTime;
  @override
  final int durationMinutes;
  @override
  @DateTimeConverter()
  final DateTime endTime;
  @override
  final String? phoneNumber;
  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PatientBookDto(id: $id, bookTime: $bookTime, durationMinutes: $durationMinutes, endTime: $endTime, phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PatientBookDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('bookTime', bookTime))
      ..add(DiagnosticsProperty('durationMinutes', durationMinutes))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientBookDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookTime, bookTime) ||
                other.bookTime == bookTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, bookTime, durationMinutes,
      endTime, phoneNumber, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientBookDtoCopyWith<_$_PatientBookDto> get copyWith =>
      __$$_PatientBookDtoCopyWithImpl<_$_PatientBookDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientBookDtoToJson(
      this,
    );
  }
}

abstract class _PatientBookDto implements PatientBookDto {
  const factory _PatientBookDto(
      {required final String id,
      @DateTimeConverter() required final DateTime bookTime,
      required final int durationMinutes,
      @DateTimeConverter() required final DateTime endTime,
      final String? phoneNumber,
      final String? firstName,
      final String? lastName}) = _$_PatientBookDto;

  factory _PatientBookDto.fromJson(Map<String, dynamic> json) =
      _$_PatientBookDto.fromJson;

  @override
  String get id;
  @override
  @DateTimeConverter()
  DateTime get bookTime;
  @override
  int get durationMinutes;
  @override
  @DateTimeConverter()
  DateTime get endTime;
  @override
  String? get phoneNumber;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$_PatientBookDtoCopyWith<_$_PatientBookDto> get copyWith =>
      throw _privateConstructorUsedError;
}
