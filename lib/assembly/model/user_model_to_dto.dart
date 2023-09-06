import 'package:injectable/injectable.dart';

import '../../data/model/user_model_dto/user_model_dto.dart';
import '../../domain/entity/user_model/user_model.dart';
import '../../domain/service/abstract/storage_service.dart';
import '../../utils/date_time_utils.dart';
import '../factory.dart';

@Injectable(as: Factory<Future<UserModelDto>, UserModel>)
class UserModelToDto implements Factory<Future<UserModelDto>, UserModel> {
  UserModelToDto(this._service);

  final StorageService _service;

  @override
  Future<UserModelDto> create(UserModel param) async {
    final photo = param.photoUrl;
    final dateOfBirth = param.dateOfBirth;
    return UserModelDto(
      id: param.id,
      email: param.email,
      firstName: param.firstName,
      lastName: param.lastName,
      dateOfBirth: dateOfBirth != null
          ? DateTimeUtils.toUtcDateOnly(dateOfBirth)
          : dateOfBirth,
      photoUrl: photo != null && !photo.startsWith('http')
          ? await _service.uploadUserPhoto(photo, param.id)
          : photo,
      phoneNumber: param.phoneNumber,
    );
  }
}
