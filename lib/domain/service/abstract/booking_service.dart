import '../../entity/patient_book/patient_book.dart';

abstract class BookingService {
  Future<Stream<List<PatientBook>>> getPatientBookings(
    String specialistId, {
    String? lastBookingId,
    int? limit,
  });
}
