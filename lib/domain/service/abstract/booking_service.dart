import '../../entity/patient_book/patient_book.dart';

abstract class BookingService {
  Future<List<PatientBook>> getPatientBookings({
    String? lastBookingId,
    int? limit,
  });
}
