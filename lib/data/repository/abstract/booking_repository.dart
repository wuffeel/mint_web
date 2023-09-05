import '../../model/patient_book_dto/patient_book_dto.dart';

abstract class BookingRepository {
  Future<List<PatientBookDto>> getPatientBookings({
    String? lastBookingId,
    int? limit,
  });
}
