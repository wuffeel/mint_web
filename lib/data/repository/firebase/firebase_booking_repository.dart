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
  Future<List<PatientBookDto>> getPatientBookings(
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

    final bookingsSnapshot =
        await query.get();

    final bookings = await _fetchBookingsWithUserDetails(
      bookingsSnapshot.docs,
      firestore,
    );

    return bookings.whereType<PatientBookDto>().toList();
  }

  Future<List<PatientBookDto?>> _fetchBookingsWithUserDetails(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> bookingDocs,
    FirebaseFirestore firestore,
  ) async {
    return Future.wait(
      bookingDocs.map((book) async {
        final data = book.data();
        final userId = data['userId'] as String?;
        if (userId == null) return null;
        final userCollection = firestore.collection(_userCollection);
        final userDoc = await userCollection.doc(userId).get();
        final userData = userDoc.data();
        if (userData == null) return null;
        final user = UserModelDto.fromJsonWithId(userData, userDoc.id);
        return PatientBookDto.fromJsonWithId(data, book.id).copyWith(
          firstName: user.firstName,
          lastName: user.lastName,
          phoneNumber: user.phoneNumber,
        );
      }),
    );
  }
}
