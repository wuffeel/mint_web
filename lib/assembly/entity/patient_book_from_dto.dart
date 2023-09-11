import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';

import '../../data/model/patient_book_dto/patient_book_dto.dart';
import '../../domain/entity/patient_book/patient_book.dart';

@Injectable(as: Factory<PatientBook, PatientBookDto>)
class UserModelFromOnboardingSpecialist
    implements Factory<PatientBook, PatientBookDto> {
  @override
  PatientBook create(PatientBookDto param) => PatientBook(
        id: param.id,
        bookTime: param.bookTime,
        durationMinutes: param.durationMinutes,
        endTime: param.endTime,
        firstName: param.firstName,
        lastName: param.lastName,
        phoneNumber: param.phoneNumber,
      );
}
