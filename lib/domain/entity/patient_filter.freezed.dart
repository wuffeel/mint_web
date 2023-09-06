// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PatientFilter {
  String get searchText => throw _privateConstructorUsedError;
  DateTime? get bookDate => throw _privateConstructorUsedError;
  ConsultationStatus? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PatientFilterCopyWith<PatientFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientFilterCopyWith<$Res> {
  factory $PatientFilterCopyWith(
          PatientFilter value, $Res Function(PatientFilter) then) =
      _$PatientFilterCopyWithImpl<$Res, PatientFilter>;
  @useResult
  $Res call(
      {String searchText, DateTime? bookDate, ConsultationStatus? status});
}

/// @nodoc
class _$PatientFilterCopyWithImpl<$Res, $Val extends PatientFilter>
    implements $PatientFilterCopyWith<$Res> {
  _$PatientFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? bookDate = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      bookDate: freezed == bookDate
          ? _value.bookDate
          : bookDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConsultationStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientFilterCopyWith<$Res>
    implements $PatientFilterCopyWith<$Res> {
  factory _$$_PatientFilterCopyWith(
          _$_PatientFilter value, $Res Function(_$_PatientFilter) then) =
      __$$_PatientFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchText, DateTime? bookDate, ConsultationStatus? status});
}

/// @nodoc
class __$$_PatientFilterCopyWithImpl<$Res>
    extends _$PatientFilterCopyWithImpl<$Res, _$_PatientFilter>
    implements _$$_PatientFilterCopyWith<$Res> {
  __$$_PatientFilterCopyWithImpl(
      _$_PatientFilter _value, $Res Function(_$_PatientFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
    Object? bookDate = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_PatientFilter(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      bookDate: freezed == bookDate
          ? _value.bookDate
          : bookDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConsultationStatus?,
    ));
  }
}

/// @nodoc

class _$_PatientFilter extends _PatientFilter {
  const _$_PatientFilter({this.searchText = '', this.bookDate, this.status})
      : super._();

  @override
  @JsonKey()
  final String searchText;
  @override
  final DateTime? bookDate;
  @override
  final ConsultationStatus? status;

  @override
  String toString() {
    return 'PatientFilter(searchText: $searchText, bookDate: $bookDate, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PatientFilter &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.bookDate, bookDate) ||
                other.bookDate == bookDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText, bookDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientFilterCopyWith<_$_PatientFilter> get copyWith =>
      __$$_PatientFilterCopyWithImpl<_$_PatientFilter>(this, _$identity);
}

abstract class _PatientFilter extends PatientFilter {
  const factory _PatientFilter(
      {final String searchText,
      final DateTime? bookDate,
      final ConsultationStatus? status}) = _$_PatientFilter;
  const _PatientFilter._() : super._();

  @override
  String get searchText;
  @override
  DateTime? get bookDate;
  @override
  ConsultationStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$_PatientFilterCopyWith<_$_PatientFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
