import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../entity/patient_book/patient_book.dart';

@lazySingleton
class BookingController {
  final _bookingController = BehaviorSubject<List<PatientBook>>();

  Stream<List<PatientBook>> get bookings => _bookingController.stream;

  bool get hasValue => _bookingController.hasValue;

  bool get hasListener => _bookingController.hasListener;

  void addToBookingStream(List<PatientBook> booking) =>
      _bookingController.add(booking);
}
