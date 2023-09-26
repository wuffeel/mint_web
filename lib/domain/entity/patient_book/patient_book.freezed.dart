// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PatientBook {
  String get id => throw _privateConstructorUsedError;
  DateTime get bookTime => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientBookCopyWith<PatientBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientBookCopyWith<$Res> {
  factory $PatientBookCopyWith(
          PatientBook value, $Res Function(PatientBook) then) =
      _$PatientBookCopyWithImpl<$Res, PatientBook>;
  @useResult
  $Res call(
      {String id,
      DateTime bookTime,
      int durationMinutes,
      DateTime endTime,
      String notes,
      String? phoneNumber,
      String? firstName,
      String? lastName});
}

/// @nodoc
class _$PatientBookCopyWithImpl<$Res, $Val extends PatientBook>
    implements $PatientBookCopyWith<$Res> {
  _$PatientBookCopyWithImpl(this._value, this._then);

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
    Object? notes = null,
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
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_PatientBookCopyWith<$Res>
    implements $PatientBookCopyWith<$Res> {
  factory _$$_PatientBookCopyWith(
          _$_PatientBook value, $Res Function(_$_PatientBook) then) =
      __$$_PatientBookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime bookTime,
      int durationMinutes,
      DateTime endTime,
      String notes,
      String? phoneNumber,
      String? firstName,
      String? lastName});
}

/// @nodoc
class __$$_PatientBookCopyWithImpl<$Res>
    extends _$PatientBookCopyWithImpl<$Res, _$_PatientBook>
    implements _$$_PatientBookCopyWith<$Res> {
  __$$_PatientBookCopyWithImpl(
      _$_PatientBook _value, $Res Function(_$_PatientBook) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookTime = null,
    Object? durationMinutes = null,
    Object? endTime = null,
    Object? notes = null,
    Object? phoneNumber = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$_PatientBook(
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
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$_PatientBook with DiagnosticableTreeMixin implements _PatientBook {
  const _$_PatientBook(
      {required this.id,
      required this.bookTime,
      required this.durationMinutes,
      required this.endTime,
      required this.notes,
      this.phoneNumber,
      this.firstName,
      this.lastName});

  @override
  final String id;
  @override
  final DateTime bookTime;
  @override
  final int durationMinutes;
  @override
  final DateTime endTime;
  @override
  final String notes;
  @override
  final String? phoneNumber;
  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PatientBook(id: $id, bookTime: $bookTime, durationMinutes: $durationMinutes, endTime: $endTime, notes: $notes, phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PatientBook'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('bookTime', bookTime))
      ..add(DiagnosticsProperty('durationMinutes', durationMinutes))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientBook &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookTime, bookTime) ||
                other.bookTime == bookTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, bookTime, durationMinutes,
      endTime, notes, phoneNumber, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientBookCopyWith<_$_PatientBook> get copyWith =>
      __$$_PatientBookCopyWithImpl<_$_PatientBook>(this, _$identity);
}

abstract class _PatientBook implements PatientBook {
  const factory _PatientBook(
      {required final String id,
      required final DateTime bookTime,
      required final int durationMinutes,
      required final DateTime endTime,
      required final String notes,
      final String? phoneNumber,
      final String? firstName,
      final String? lastName}) = _$_PatientBook;

  @override
  String get id;
  @override
  DateTime get bookTime;
  @override
  int get durationMinutes;
  @override
  DateTime get endTime;
  @override
  String get notes;
  @override
  String? get phoneNumber;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$_PatientBookCopyWith<_$_PatientBook> get copyWith =>
      throw _privateConstructorUsedError;
}
