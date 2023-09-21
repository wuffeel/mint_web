import '../../model/patient_book_dto/patient_book_dto.dart';

abstract class BookingRepository {
  Future<Stream<List<PatientBookDto>>> getPatientBookings(
    String specialistId, {
    String? lastBookingId,
    int? limit,
  });
}
