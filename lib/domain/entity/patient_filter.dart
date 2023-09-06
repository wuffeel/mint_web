import 'package:freezed_annotation/freezed_annotation.dart';

import '../../backbone/consultation_status.dart';

part 'patient_filter.freezed.dart';

@freezed
class PatientFilter with _$PatientFilter {
  const factory PatientFilter({
    @Default('') String searchText,
    DateTime? bookDate,
    ConsultationStatus? status,
  }) = _PatientFilter;

  const PatientFilter._();

  static const empty = PatientFilter();

  bool get isEmpty => this == empty;
}
