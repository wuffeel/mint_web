// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i42;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_web/assembly/entity/onboarding_specialist_from_onboarding.dart'
    as _i18;
import 'package:mint_web/assembly/entity/patient_book_from_dto.dart' as _i6;
import 'package:mint_web/assembly/entity/specialist_model_from_dto.dart'
    as _i43;
import 'package:mint_web/assembly/entity/specialist_model_from_onboarding_specialist.dart'
    as _i19;
import 'package:mint_web/assembly/entity/user_model_from_dto.dart' as _i44;
import 'package:mint_web/assembly/entity/user_model_from_onboarding_specialist.dart'
    as _i9;
import 'package:mint_web/assembly/factory.dart' as _i3;
import 'package:mint_web/assembly/model/onboarding_specialist_to_dto.dart'
    as _i13;
import 'package:mint_web/assembly/model/specialist_model_to_dto.dart' as _i16;
import 'package:mint_web/assembly/model/user_model_to_dto.dart' as _i45;
import 'package:mint_web/assembly/modified_user_dto_to_map.dart' as _i11;
import 'package:mint_web/data/model/onboarding_specialist_dto/onboarding_specialist_dto.dart'
    as _i12;
import 'package:mint_web/data/model/patient_book_dto/patient_book_dto.dart'
    as _i5;
import 'package:mint_web/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i14;
import 'package:mint_web/data/model/user_model_dto/user_model_dto.dart' as _i10;
import 'package:mint_web/data/repository/abstract/booking_repository.dart'
    as _i38;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i21;
import 'package:mint_web/data/repository/abstract/specialist_repository.dart'
    as _i26;
import 'package:mint_web/data/repository/abstract/storage_repository.dart'
    as _i28;
import 'package:mint_web/data/repository/abstract/user_repository.dart' as _i33;
import 'package:mint_web/data/repository/firebase/firebase_booking_repository.dart'
    as _i39;
import 'package:mint_web/data/repository/firebase/firebase_initializer.dart'
    as _i20;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i22;
import 'package:mint_web/data/repository/firebase/firebase_specialist_repository.dart'
    as _i27;
import 'package:mint_web/data/repository/firebase/firebase_storage_repository.dart'
    as _i29;
import 'package:mint_web/data/repository/firebase/firebase_user_repository.dart'
    as _i34;
import 'package:mint_web/domain/controller/specialist_controller.dart' as _i25;
import 'package:mint_web/domain/controller/user_controller.dart' as _i32;
import 'package:mint_web/domain/entity/onboarding/onboarding.dart' as _i17;
import 'package:mint_web/domain/entity/onboarding_specialist/onboarding_specialist.dart'
    as _i8;
import 'package:mint_web/domain/entity/patient_book/patient_book.dart' as _i4;
import 'package:mint_web/domain/entity/specialist_model/specialist_model.dart'
    as _i15;
import 'package:mint_web/domain/entity/user_model/user_model.dart' as _i7;
import 'package:mint_web/domain/service/abstract/booking_service.dart' as _i40;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i23;
import 'package:mint_web/domain/service/abstract/specialist_service.dart'
    as _i47;
import 'package:mint_web/domain/service/abstract/storage_service.dart' as _i30;
import 'package:mint_web/domain/service/abstract/user_service.dart' as _i49;
import 'package:mint_web/domain/service/firebase/firebase_booking_service.dart'
    as _i41;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i24;
import 'package:mint_web/domain/service/firebase/firebase_specialist_service.dart'
    as _i48;
import 'package:mint_web/domain/service/firebase/firebase_storage_service.dart'
    as _i31;
import 'package:mint_web/domain/service/firebase/firebase_user_service.dart'
    as _i50;
import 'package:mint_web/domain/usecase/add_new_specialist_use_case.dart'
    as _i51;
import 'package:mint_web/domain/usecase/add_work_info_data_use_case.dart'
    as _i52;
import 'package:mint_web/domain/usecase/fetch_patient_book_list_use_case.dart'
    as _i46;
import 'package:mint_web/domain/usecase/fetch_specialist_data_use_case.dart'
    as _i53;
import 'package:mint_web/domain/usecase/fetch_specializations_use_case.dart'
    as _i54;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i55;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i56;
import 'package:mint_web/domain/usecase/update_user_data_use_case.dart' as _i59;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i35;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i36;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i37;
import 'package:mint_web/presentation/bloc/onboarding/onboarding_bloc.dart'
    as _i57;
import 'package:mint_web/presentation/bloc/specialist/specialist_bloc.dart'
    as _i61;
import 'package:mint_web/presentation/bloc/specialist_info/specialist_info_bloc.dart'
    as _i58;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i60;

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
    gh.factory<_i3.Factory<_i4.PatientBook, _i5.PatientBookDto>>(
        () => _i6.UserModelFromOnboardingSpecialist());
    gh.factory<_i3.Factory<_i7.UserModel, _i8.OnboardingSpecialist>>(
        () => _i9.UserModelFromOnboardingSpecialist());
    gh.factory<_i3.Factory<Map<String, dynamic>, _i10.UserModelDto>>(
        () => _i11.ModifiedUserDtoToMap());
    gh.factory<
            _i3
            .Factory<_i12.OnboardingSpecialistDto, _i8.OnboardingSpecialist>>(
        () => _i13.OnboardingSpecialistToDto());
    gh.factory<_i3.Factory<_i14.SpecialistModelDto, _i15.SpecialistModel>>(
        () => _i16.SpecialistModelToDto());
    gh.factory<_i3.Factory<_i8.OnboardingSpecialist?, _i17.Onboarding>>(
        () => _i18.OnboardingSpecialistFromOnboarding());
    gh.factory<_i3.Factory<_i15.SpecialistModel, _i8.OnboardingSpecialist>>(
        () => _i19.SpecialistModelFromOnboardingSpecialist());
    gh.lazySingleton<_i20.FirebaseInitializer>(
        () => _i20.FirebaseInitializer());
    gh.lazySingleton<_i21.PhoneAuthRepository>(
        () => _i22.FirebasePhoneAuthRepository(gh<_i20.FirebaseInitializer>()));
    gh.factory<_i23.PhoneAuthService>(
        () => _i24.FirebasePhoneAuthService(gh<_i21.PhoneAuthRepository>()));
    gh.lazySingleton<_i25.SpecialistController>(
        () => _i25.SpecialistController());
    gh.factory<_i26.SpecialistRepository>(() =>
        _i27.FirebaseSpecialistRepository(gh<_i20.FirebaseInitializer>()));
    gh.factory<_i28.StorageRepository>(
        () => _i29.FirebaseStorageRepository(gh<_i20.FirebaseInitializer>()));
    gh.factory<_i30.StorageService>(
        () => _i31.FirebaseStorageService(gh<_i28.StorageRepository>()));
    gh.lazySingleton<_i32.UserController>(() => _i32.UserController());
    gh.factory<_i33.UserRepository>(() => _i34.FirebaseUserRepository(
          gh<_i20.FirebaseInitializer>(),
          gh<_i3.Factory<Map<String, dynamic>, _i10.UserModelDto>>(),
        ));
    gh.factory<_i35.VerifyOtpUseCase>(
        () => _i35.VerifyOtpUseCase(gh<_i23.PhoneAuthService>()));
    gh.factory<_i36.VerifyPhoneUseCase>(
        () => _i36.VerifyPhoneUseCase(gh<_i23.PhoneAuthService>()));
    gh.factory<_i37.AuthBloc>(() => _i37.AuthBloc(
          gh<_i36.VerifyPhoneUseCase>(),
          gh<_i35.VerifyOtpUseCase>(),
        ));
    gh.factory<_i38.BookingRepository>(
        () => _i39.FirebaseBookingRepository(gh<_i20.FirebaseInitializer>()));
    gh.factory<_i40.BookingService>(() => _i41.FirebaseBookingService(
          gh<_i38.BookingRepository>(),
          gh<_i3.Factory<_i4.PatientBook, _i5.PatientBookDto>>(),
        ));
    gh.factory<
            _i3.Factory<_i42.Future<_i15.SpecialistModel>,
                _i14.SpecialistModelDto>>(
        () => _i43.SpecialistModelFromDto(gh<_i30.StorageService>()));
    gh.factory<_i3.Factory<_i42.Future<_i7.UserModel>, _i10.UserModelDto>>(
        () => _i44.UserModelFromDto(gh<_i30.StorageService>()));
    gh.factory<_i3.Factory<_i42.Future<_i10.UserModelDto>, _i7.UserModel>>(
        () => _i45.UserModelToDto(gh<_i30.StorageService>()));
    gh.factory<_i46.FetchPatientBookListUseCase>(
        () => _i46.FetchPatientBookListUseCase(gh<_i40.BookingService>()));
    gh.factory<_i47.SpecialistService>(() => _i48.FirebaseSpecialistService(
          gh<_i26.SpecialistRepository>(),
          gh<
              _i3.Factory<_i42.Future<_i15.SpecialistModel>,
                  _i14.SpecialistModelDto>>(),
          gh<_i3.Factory<_i14.SpecialistModelDto, _i15.SpecialistModel>>(),
        ));
    gh.factory<_i49.UserService>(() => _i50.FirebaseUserService(
          gh<_i33.UserRepository>(),
          gh<_i3.Factory<_i42.Future<_i7.UserModel>, _i10.UserModelDto>>(),
          gh<_i3.Factory<_i42.Future<_i10.UserModelDto>, _i7.UserModel>>(),
        ));
    gh.factory<_i51.AddSpecialistWithIdUseCase>(
        () => _i51.AddSpecialistWithIdUseCase(gh<_i47.SpecialistService>()));
    gh.factory<_i52.AddWorkInfoDataUseCase>(
        () => _i52.AddWorkInfoDataUseCase(gh<_i47.SpecialistService>()));
    gh.factory<_i53.FetchSpecialistDataUseCase>(
        () => _i53.FetchSpecialistDataUseCase(gh<_i47.SpecialistService>()));
    gh.factory<_i54.FetchSpecializationsUseCase>(
        () => _i54.FetchSpecializationsUseCase(gh<_i47.SpecialistService>()));
    gh.factory<_i55.FetchUserUseCase>(
        () => _i55.FetchUserUseCase(gh<_i49.UserService>()));
    gh.factory<_i56.LogOutUseCase>(
        () => _i56.LogOutUseCase(gh<_i49.UserService>()));
    gh.factory<_i57.OnboardingBloc>(
        () => _i57.OnboardingBloc(gh<_i54.FetchSpecializationsUseCase>()));
    gh.factory<_i58.SpecialistInfoBloc>(() => _i58.SpecialistInfoBloc(
          gh<_i53.FetchSpecialistDataUseCase>(),
          gh<_i25.SpecialistController>(),
          gh<_i32.UserController>(),
        ));
    gh.factory<_i59.UpdateUserDataUseCase>(
        () => _i59.UpdateUserDataUseCase(gh<_i49.UserService>()));
    gh.factory<_i60.UserBloc>(() => _i60.UserBloc(
          gh<_i32.UserController>(),
          gh<_i55.FetchUserUseCase>(),
          gh<_i56.LogOutUseCase>(),
        ));
    gh.factory<_i61.SpecialistBloc>(() => _i61.SpecialistBloc(
          gh<_i51.AddSpecialistWithIdUseCase>(),
          gh<_i59.UpdateUserDataUseCase>(),
          gh<_i52.AddWorkInfoDataUseCase>(),
          gh<_i3.Factory<_i8.OnboardingSpecialist?, _i17.Onboarding>>(),
          gh<_i3.Factory<_i15.SpecialistModel, _i8.OnboardingSpecialist>>(),
          gh<_i3.Factory<_i7.UserModel, _i8.OnboardingSpecialist>>(),
          gh<_i32.UserController>(),
          gh<_i25.SpecialistController>(),
        ));
    return this;
  }
}
