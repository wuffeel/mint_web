// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i35;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_web/assembly/entity/onboarding_specialist_from_onboarding.dart'
    as _i13;
import 'package:mint_web/assembly/entity/specialist_model_from_dto.dart'
    as _i36;
import 'package:mint_web/assembly/entity/specialist_model_from_onboarding_specialist.dart'
    as _i14;
import 'package:mint_web/assembly/entity/user_model_from_dto.dart' as _i38;
import 'package:mint_web/assembly/entity/user_model_from_onboarding_specialist.dart'
    as _i16;
import 'package:mint_web/assembly/factory.dart' as _i3;
import 'package:mint_web/assembly/model/onboarding_specialist_to_dto.dart'
    as _i11;
import 'package:mint_web/assembly/model/specialist_model_to_dto.dart' as _i8;
import 'package:mint_web/assembly/model/user_model_to_dto.dart' as _i37;
import 'package:mint_web/assembly/modified_user_dto_to_map.dart' as _i5;
import 'package:mint_web/data/model/onboarding_specialist_dto/onboarding_specialist_dto.dart'
    as _i9;
import 'package:mint_web/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i6;
import 'package:mint_web/data/model/user_model_dto/user_model_dto.dart' as _i4;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i18;
import 'package:mint_web/data/repository/abstract/specialist_repository.dart'
    as _i23;
import 'package:mint_web/data/repository/abstract/storage_repository.dart'
    as _i25;
import 'package:mint_web/data/repository/abstract/user_repository.dart' as _i30;
import 'package:mint_web/data/repository/firebase/firebase_initializer.dart'
    as _i17;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i19;
import 'package:mint_web/data/repository/firebase/firebase_specialist_repository.dart'
    as _i24;
import 'package:mint_web/data/repository/firebase/firebase_storage_repository.dart'
    as _i26;
import 'package:mint_web/data/repository/firebase/firebase_user_repository.dart'
    as _i31;
import 'package:mint_web/domain/controller/specialist_controller.dart' as _i22;
import 'package:mint_web/domain/controller/user_controller.dart' as _i29;
import 'package:mint_web/domain/entity/onboarding/onboarding.dart' as _i12;
import 'package:mint_web/domain/entity/onboarding_specialist/onboarding_specialist.dart'
    as _i10;
import 'package:mint_web/domain/entity/specialist_model/specialist_model.dart'
    as _i7;
import 'package:mint_web/domain/entity/user_model/user_model.dart' as _i15;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i20;
import 'package:mint_web/domain/service/abstract/specialist_service.dart'
    as _i39;
import 'package:mint_web/domain/service/abstract/storage_service.dart' as _i27;
import 'package:mint_web/domain/service/abstract/user_service.dart' as _i41;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i21;
import 'package:mint_web/domain/service/firebase/firebase_specialist_service.dart'
    as _i40;
import 'package:mint_web/domain/service/firebase/firebase_storage_service.dart'
    as _i28;
import 'package:mint_web/domain/service/firebase/firebase_user_service.dart'
    as _i42;
import 'package:mint_web/domain/usecase/add_new_specialist_use_case.dart'
    as _i43;
import 'package:mint_web/domain/usecase/add_work_info_data_use_case.dart'
    as _i44;
import 'package:mint_web/domain/usecase/fetch_specialist_data_use_case.dart'
    as _i45;
import 'package:mint_web/domain/usecase/fetch_specializations_use_case.dart'
    as _i46;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i47;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i48;
import 'package:mint_web/domain/usecase/update_user_data_use_case.dart' as _i51;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i32;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i33;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i34;
import 'package:mint_web/presentation/bloc/onboarding/onboarding_bloc.dart'
    as _i49;
import 'package:mint_web/presentation/bloc/specialist/specialist_bloc.dart'
    as _i53;
import 'package:mint_web/presentation/bloc/specialist_info/specialist_info_bloc.dart'
    as _i50;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i52;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.Factory<Map<String, dynamic>, _i4.UserModelDto>>(
        () => _i5.ModifiedUserDtoToMap());
    gh.factory<_i3.Factory<_i6.SpecialistModelDto, _i7.SpecialistModel>>(
        () => _i8.SpecialistModelToDto());
    gh.factory<
            _i3
            .Factory<_i9.OnboardingSpecialistDto, _i10.OnboardingSpecialist>>(
        () => _i11.OnboardingSpecialistToDto());
    gh.factory<_i3.Factory<_i10.OnboardingSpecialist?, _i12.Onboarding>>(
        () => _i13.OnboardingSpecialistFromOnboarding());
    gh.factory<_i3.Factory<_i7.SpecialistModel, _i10.OnboardingSpecialist>>(
        () => _i14.SpecialistModelFromOnboardingSpecialist());
    gh.factory<_i3.Factory<_i15.UserModel, _i10.OnboardingSpecialist>>(
        () => _i16.UserModelFromOnboardingSpecialist());
    gh.lazySingleton<_i17.FirebaseInitializer>(
        () => _i17.FirebaseInitializer());
    gh.lazySingleton<_i18.PhoneAuthRepository>(
        () => _i19.FirebasePhoneAuthRepository(gh<_i17.FirebaseInitializer>()));
    gh.factory<_i20.PhoneAuthService>(
        () => _i21.FirebasePhoneAuthService(gh<_i18.PhoneAuthRepository>()));
    gh.lazySingleton<_i22.SpecialistController>(
        () => _i22.SpecialistController());
    gh.factory<_i23.SpecialistRepository>(() =>
        _i24.FirebaseSpecialistRepository(gh<_i17.FirebaseInitializer>()));
    gh.factory<_i25.StorageRepository>(
        () => _i26.FirebaseStorageRepository(gh<_i17.FirebaseInitializer>()));
    gh.factory<_i27.StorageService>(
        () => _i28.FirebaseStorageService(gh<_i25.StorageRepository>()));
    gh.lazySingleton<_i29.UserController>(() => _i29.UserController());
    gh.factory<_i30.UserRepository>(() => _i31.FirebaseUserRepository(
          gh<_i17.FirebaseInitializer>(),
          gh<_i3.Factory<Map<String, dynamic>, _i4.UserModelDto>>(),
        ));
    gh.factory<_i32.VerifyOtpUseCase>(
        () => _i32.VerifyOtpUseCase(gh<_i20.PhoneAuthService>()));
    gh.factory<_i33.VerifyPhoneUseCase>(
        () => _i33.VerifyPhoneUseCase(gh<_i20.PhoneAuthService>()));
    gh.factory<_i34.AuthBloc>(() => _i34.AuthBloc(
          gh<_i33.VerifyPhoneUseCase>(),
          gh<_i32.VerifyOtpUseCase>(),
        ));
    gh.factory<
            _i3
            .Factory<_i35.Future<_i7.SpecialistModel>, _i6.SpecialistModelDto>>(
        () => _i36.SpecialistModelFromDto(gh<_i27.StorageService>()));
    gh.factory<_i3.Factory<_i35.Future<_i4.UserModelDto>, _i15.UserModel>>(
        () => _i37.UserModelToDto(gh<_i27.StorageService>()));
    gh.factory<_i3.Factory<_i35.Future<_i15.UserModel>, _i4.UserModelDto>>(
        () => _i38.UserModelFromDto(gh<_i27.StorageService>()));
    gh.factory<_i39.SpecialistService>(() => _i40.FirebaseSpecialistService(
          gh<_i23.SpecialistRepository>(),
          gh<
              _i3.Factory<_i35.Future<_i7.SpecialistModel>,
                  _i6.SpecialistModelDto>>(),
          gh<_i3.Factory<_i6.SpecialistModelDto, _i7.SpecialistModel>>(),
        ));
    gh.factory<_i41.UserService>(() => _i42.FirebaseUserService(
          gh<_i30.UserRepository>(),
          gh<_i3.Factory<_i35.Future<_i15.UserModel>, _i4.UserModelDto>>(),
          gh<_i3.Factory<_i35.Future<_i4.UserModelDto>, _i15.UserModel>>(),
        ));
    gh.factory<_i43.AddSpecialistWithIdUseCase>(
        () => _i43.AddSpecialistWithIdUseCase(gh<_i39.SpecialistService>()));
    gh.factory<_i44.AddWorkInfoDataUseCase>(
        () => _i44.AddWorkInfoDataUseCase(gh<_i39.SpecialistService>()));
    gh.factory<_i45.FetchSpecialistDataUseCase>(
        () => _i45.FetchSpecialistDataUseCase(gh<_i39.SpecialistService>()));
    gh.factory<_i46.FetchSpecializationsUseCase>(
        () => _i46.FetchSpecializationsUseCase(gh<_i39.SpecialistService>()));
    gh.factory<_i47.FetchUserUseCase>(
        () => _i47.FetchUserUseCase(gh<_i41.UserService>()));
    gh.factory<_i48.LogOutUseCase>(
        () => _i48.LogOutUseCase(gh<_i41.UserService>()));
    gh.factory<_i49.OnboardingBloc>(
        () => _i49.OnboardingBloc(gh<_i46.FetchSpecializationsUseCase>()));
    gh.factory<_i50.SpecialistInfoBloc>(() => _i50.SpecialistInfoBloc(
          gh<_i45.FetchSpecialistDataUseCase>(),
          gh<_i22.SpecialistController>(),
          gh<_i29.UserController>(),
        ));
    gh.factory<_i51.UpdateUserDataUseCase>(
        () => _i51.UpdateUserDataUseCase(gh<_i41.UserService>()));
    gh.factory<_i52.UserBloc>(() => _i52.UserBloc(
          gh<_i29.UserController>(),
          gh<_i47.FetchUserUseCase>(),
          gh<_i48.LogOutUseCase>(),
        ));
    gh.factory<_i53.SpecialistBloc>(() => _i53.SpecialistBloc(
          gh<_i43.AddSpecialistWithIdUseCase>(),
          gh<_i51.UpdateUserDataUseCase>(),
          gh<_i44.AddWorkInfoDataUseCase>(),
          gh<_i3.Factory<_i10.OnboardingSpecialist?, _i12.Onboarding>>(),
          gh<_i3.Factory<_i7.SpecialistModel, _i10.OnboardingSpecialist>>(),
          gh<_i3.Factory<_i15.UserModel, _i10.OnboardingSpecialist>>(),
          gh<_i29.UserController>(),
          gh<_i22.SpecialistController>(),
        ));
    return this;
  }
}
