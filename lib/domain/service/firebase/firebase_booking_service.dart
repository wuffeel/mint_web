import 'package:injectable/injectable.dart';

import '../../../assembly/factory.dart';
import '../../../data/model/patient_book_dto/patient_book_dto.dart';
import '../../../data/repository/abstract/booking_repository.dart';
import '../../entity/patient_book/patient_book.dart';
import '../abstract/booking_service.dart';

@Injectable(as: BookingService)
class FirebaseBookingService implements BookingService {
  FirebaseBookingService(
    this._bookingRepository,
    this._patientBookFromDto,
  );

  final BookingRepository _bookingRepository;

  final Factory<PatientBook, PatientBookDto> _patientBookFromDto;

  @override
  Future<List<PatientBook>> getPatientBookings({
    String? lastBookingId,
    int? limit,
  }) async {
    final bookingsDto = await _bookingRepository.getPatientBookings(
      lastBookingId: lastBookingId,
      limit: limit,
    );
    return bookingsDto.map(_patientBookFromDto.create).toList();
  }
}
