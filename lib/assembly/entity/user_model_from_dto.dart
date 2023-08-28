import 'package:injectable/injectable.dart';

import '../../data/model/user_model_dto/user_model_dto.dart';
import '../../domain/entity/user_model/user_model.dart';
import '../../domain/service/abstract/storage_service.dart';
import '../factory.dart';

@Injectable(as: Factory<UserModel, UserModelDto>)
class UserModelFromDto implements Factory<Future<UserModel>, UserModelDto> {
  UserModelFromDto(this._service);

  final StorageService _service;

  @override
  Future<UserModel> create(UserModelDto param) async => UserModel(
    id: param.id,
    phoneNumber: param.phoneNumber,
    photoUrl: await _service.getLinkByStorageUrl(param.photoUrl),
    firstName: param.firstName,
    lastName: param.lastName,
    dateOfBirth: param.dateOfBirth,
  );
}
