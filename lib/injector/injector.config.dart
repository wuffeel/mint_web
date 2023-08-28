// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i19;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_web/assembly/entity/user_model_from_dto.dart' as _i22;
import 'package:mint_web/assembly/factory.dart' as _i18;
import 'package:mint_web/data/model/user_model_dto/user_model_dto.dart' as _i21;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i4;
import 'package:mint_web/data/repository/abstract/storage_repository.dart'
    as _i8;
import 'package:mint_web/data/repository/abstract/user_repository.dart' as _i13;
import 'package:mint_web/data/repository/firebase/firebase_initializer.dart'
    as _i3;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i5;
import 'package:mint_web/data/repository/firebase/firebase_storage_repository.dart'
    as _i9;
import 'package:mint_web/data/repository/firebase/firebase_user_repository.dart'
    as _i14;
import 'package:mint_web/domain/controller/user_controller.dart' as _i12;
import 'package:mint_web/domain/entity/user_model/user_model.dart' as _i20;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i6;
import 'package:mint_web/domain/service/abstract/storage_service.dart' as _i10;
import 'package:mint_web/domain/service/abstract/user_service.dart' as _i23;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i7;
import 'package:mint_web/domain/service/firebase/firebase_storage_service.dart'
    as _i11;
import 'package:mint_web/domain/service/firebase/firebase_user_service.dart'
    as _i24;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i25;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i26;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i15;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i16;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i17;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i27;

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
    gh.lazySingleton<_i3.FirebaseInitializer>(() => _i3.FirebaseInitializer());
    gh.lazySingleton<_i4.PhoneAuthRepository>(
        () => _i5.FirebasePhoneAuthRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i6.PhoneAuthService>(
        () => _i7.FirebasePhoneAuthService(gh<_i4.PhoneAuthRepository>()));
    gh.factory<_i8.StorageRepository>(
        () => _i9.FirebaseStorageRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i10.StorageService>(
        () => _i11.FirebaseStorageService(gh<_i8.StorageRepository>()));
    gh.lazySingleton<_i12.UserController>(() => _i12.UserController());
    gh.factory<_i13.UserRepository>(
        () => _i14.FirebaseUserRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i15.VerifyOtpUseCase>(
        () => _i15.VerifyOtpUseCase(gh<_i6.PhoneAuthService>()));
    gh.factory<_i16.VerifyPhoneUseCase>(
        () => _i16.VerifyPhoneUseCase(gh<_i6.PhoneAuthService>()));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
          gh<_i16.VerifyPhoneUseCase>(),
          gh<_i15.VerifyOtpUseCase>(),
        ));
    gh.factory<_i18.Factory<_i19.Future<_i20.UserModel>, _i21.UserModelDto>>(
        () => _i22.UserModelFromDto(gh<_i10.StorageService>()));
    gh.factory<_i23.UserService>(() => _i24.FirebaseUserService(
          gh<_i13.UserRepository>(),
          gh<_i18.Factory<_i19.Future<_i20.UserModel>, _i21.UserModelDto>>(),
        ));
    gh.factory<_i25.FetchUserUseCase>(
        () => _i25.FetchUserUseCase(gh<_i23.UserService>()));
    gh.factory<_i26.LogOutUseCase>(
        () => _i26.LogOutUseCase(gh<_i23.UserService>()));
    gh.factory<_i27.UserBloc>(() => _i27.UserBloc(
          gh<_i12.UserController>(),
          gh<_i25.FetchUserUseCase>(),
          gh<_i26.LogOutUseCase>(),
        ));
    return this;
  }
}
