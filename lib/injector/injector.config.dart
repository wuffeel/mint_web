// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i22;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_web/assembly/entity/user_model_from_dto.dart' as _i25;
import 'package:mint_web/assembly/factory.dart' as _i3;
import 'package:mint_web/assembly/model/onboarding_specialist_to_dto.dart'
    as _i6;
import 'package:mint_web/data/model/onboarding_specialist_dto/onboarding_specialist_dto.dart'
    as _i4;
import 'package:mint_web/data/model/user_model_dto/user_model_dto.dart' as _i24;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i8;
import 'package:mint_web/data/repository/abstract/storage_repository.dart'
    as _i12;
import 'package:mint_web/data/repository/abstract/user_repository.dart' as _i17;
import 'package:mint_web/data/repository/firebase/firebase_initializer.dart'
    as _i7;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i9;
import 'package:mint_web/data/repository/firebase/firebase_storage_repository.dart'
    as _i13;
import 'package:mint_web/data/repository/firebase/firebase_user_repository.dart'
    as _i18;
import 'package:mint_web/domain/controller/user_controller.dart' as _i16;
import 'package:mint_web/domain/entity/onboarding_specialist/onboarding_specialist.dart'
    as _i5;
import 'package:mint_web/domain/entity/user_model/user_model.dart' as _i23;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i10;
import 'package:mint_web/domain/service/abstract/storage_service.dart' as _i14;
import 'package:mint_web/domain/service/abstract/user_service.dart' as _i26;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i11;
import 'package:mint_web/domain/service/firebase/firebase_storage_service.dart'
    as _i15;
import 'package:mint_web/domain/service/firebase/firebase_user_service.dart'
    as _i27;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i28;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i29;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i19;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i20;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i21;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i30;

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
    gh.factory<
            _i3.Factory<_i4.OnboardingSpecialistDto, _i5.OnboardingSpecialist>>(
        () => _i6.OnboardingSpecialistToDto());
    gh.lazySingleton<_i7.FirebaseInitializer>(() => _i7.FirebaseInitializer());
    gh.lazySingleton<_i8.PhoneAuthRepository>(
        () => _i9.FirebasePhoneAuthRepository(gh<_i7.FirebaseInitializer>()));
    gh.factory<_i10.PhoneAuthService>(
        () => _i11.FirebasePhoneAuthService(gh<_i8.PhoneAuthRepository>()));
    gh.factory<_i12.StorageRepository>(
        () => _i13.FirebaseStorageRepository(gh<_i7.FirebaseInitializer>()));
    gh.factory<_i14.StorageService>(
        () => _i15.FirebaseStorageService(gh<_i12.StorageRepository>()));
    gh.lazySingleton<_i16.UserController>(() => _i16.UserController());
    gh.factory<_i17.UserRepository>(
        () => _i18.FirebaseUserRepository(gh<_i7.FirebaseInitializer>()));
    gh.factory<_i19.VerifyOtpUseCase>(
        () => _i19.VerifyOtpUseCase(gh<_i10.PhoneAuthService>()));
    gh.factory<_i20.VerifyPhoneUseCase>(
        () => _i20.VerifyPhoneUseCase(gh<_i10.PhoneAuthService>()));
    gh.factory<_i21.AuthBloc>(() => _i21.AuthBloc(
          gh<_i20.VerifyPhoneUseCase>(),
          gh<_i19.VerifyOtpUseCase>(),
        ));
    gh.factory<_i3.Factory<_i22.Future<_i23.UserModel>, _i24.UserModelDto>>(
        () => _i25.UserModelFromDto(gh<_i14.StorageService>()));
    gh.factory<_i26.UserService>(() => _i27.FirebaseUserService(
          gh<_i17.UserRepository>(),
          gh<_i3.Factory<_i22.Future<_i23.UserModel>, _i24.UserModelDto>>(),
        ));
    gh.factory<_i28.FetchUserUseCase>(
        () => _i28.FetchUserUseCase(gh<_i26.UserService>()));
    gh.factory<_i29.LogOutUseCase>(
        () => _i29.LogOutUseCase(gh<_i26.UserService>()));
    gh.factory<_i30.UserBloc>(() => _i30.UserBloc(
          gh<_i16.UserController>(),
          gh<_i28.FetchUserUseCase>(),
          gh<_i29.LogOutUseCase>(),
        ));
    return this;
  }
}
