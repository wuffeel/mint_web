import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../../model/patient_book_dto/patient_book_dto.dart';
import '../abstract/booking_repository.dart';

@Injectable(as: BookingRepository)
class FirebaseBookingRepository implements BookingRepository {
  FirebaseBookingRepository(this._firebaseInitializer);

  static const _bookingsCollection = 'bookings';
  static const _userCollection = 'users';

  final FirebaseInitializer _firebaseInitializer;

  @override
  Future<Stream<List<PatientBookDto>>> getPatientBookings(
    String specialistId, {
    String? lastBookingId,
    int? limit,
  }) async {
    final firestore = await _firebaseInitializer.firestore;

    var query = firestore
        .collection(_bookingsCollection)
        .where('specialistId', isEqualTo: specialistId);

    if (limit != null) {
      query = query.limit(limit);
    }

    if (lastBookingId != null) {
      final doc = await firestore
          .collection(_bookingsCollection)
          .doc(lastBookingId)
          .get();
      query = query.startAfterDocument(doc);
    }

    final bookingsSnapshots = query.snapshots();

    return _fetchBookingsWithUserDetails(bookingsSnapshots, firestore);
  }

  Future<Stream<List<PatientBookDto>>> _fetchBookingsWithUserDetails(
    Stream<QuerySnapshot<Map<String, dynamic>>> bookingSnaps,
    FirebaseFirestore firestore,
  ) async {
    return bookingSnaps.asyncMap((snap) async {
      final patientBookings = <PatientBookDto>[];
      for (final book in snap.docs) {
        final data = book.data();
        final userId = data['userId'] as String?;

        if (userId == null) continue;

        final userCollection = firestore.collection(_userCollection);
        final userDoc = await userCollection.doc(userId).get();
        final userData = userDoc.data();

        if (userData == null) continue;

        final user = UserModelDto.fromJsonWithId(userData, userDoc.id);

        final patientBooking =
            PatientBookDto.fromJsonWithId(data, book.id).copyWith(
          firstName: user.firstName,
          lastName: user.lastName,
          phoneNumber: user.phoneNumber,
        );
        patientBookings.add(patientBooking);
      }
      return patientBookings;
    });
  }
}
