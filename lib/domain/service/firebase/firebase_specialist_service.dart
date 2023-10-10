import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../../../data/model/specialist_profile_model_dto/specialist_profile_model_dto.dart';
import '../../../data/repository/abstract/specialist_repository.dart';
import '../../entity/specialist_profile_model/specialist_profile_model.dart';
import '../abstract/specialist_service.dart';

@Injectable(as: SpecialistService)
class FirebaseSpecialistService implements SpecialistService {
  FirebaseSpecialistService(
    this._specialistRepository,
    this._userService,
    this._specialistModelFromDto,
    this._specialistModelToDto,
    this._specialistProfileFromModel,
    this._specialistProfileModelToDto,
  );

  final SpecialistRepository _specialistRepository;
  final UserService _userService;

  final Factory<Future<SpecialistModel>, SpecialistModelDto>
      _specialistModelFromDto;
  final Factory<SpecialistModelDto, SpecialistModel> _specialistModelToDto;
  final Factory<SpecialistProfileModel, SpecialistModel>
      _specialistProfileFromModel;
  final Factory<SpecialistProfileModelDto, SpecialistProfileModel>
      _specialistProfileModelToDto;

  @override
  Future<List<String>> fetchAvailableSpecializations() {
    return _specialistRepository.fetchAvailableSpecializations();
  }

  @override
  Future<void> addSpecialistWithId(
    String id,
    SpecialistModel specialist,
  ) async {
    return _specialistRepository.addSpecialistWithId(
      id,
      _specialistModelToDto.create(specialist),
    );
  }

  @override
  Future<void> addWorkInfoData(
    String specialistId,
    Map<String, Map<String, String>> workInfoMap,
  ) {
    return _specialistRepository.addWorkInfoData(specialistId, workInfoMap);
  }

  @override
  Future<SpecialistModel?> fetchSpecialistData(String specialistId) async {
    final specialist = await _specialistRepository.fetchSpecialistData(
      specialistId,
    );
    if (specialist == null) return null;
    return _specialistModelFromDto.create(specialist);
  }

  @override
  Future<String?> updateSpecialistData(
    SpecialistModel specialist,
    UserModel user, {
    FileData? photoData,
  }) async {
    final specialistProfile = _specialistProfileFromModel.create(specialist);
    final specialistProfileDto = _specialistProfileModelToDto.create(
      specialistProfile,
    );

    /// photoUrl for specialist in 'specialists' collection updated here
    final userData = await _userService.updateUserData(
      user,
      photoData: photoData,
    );

    await _specialistRepository.updateSpecialistData(
      specialistProfileDto.copyWith(photoUrl: userData.photoUrl),
    );

    return userData.photoUrl;
  }
}
