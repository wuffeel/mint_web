import 'package:injectable/injectable.dart';

import '../entity/patient_book/patient_book.dart';
import '../service/abstract/booking_service.dart';

@injectable
class FetchPatientBookListUseCase {
  FetchPatientBookListUseCase(this._service);

  final BookingService _service;

  Future<List<PatientBook>> call(
    String specialistId, {
    String? lastBookingId,
    int? limit,
  }) =>
      _service.getPatientBookings(
        specialistId,
        lastBookingId: lastBookingId,
        limit: limit,
      );
}
