// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i40;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_web/assembly/entity/onboarding_specialist_from_onboarding.dart'
    as _i6;
import 'package:mint_web/assembly/entity/patient_book_from_dto.dart' as _i16;
import 'package:mint_web/assembly/entity/specialist_model_from_dto.dart'
    as _i42;
import 'package:mint_web/assembly/entity/specialist_model_from_onboarding_specialist.dart'
    as _i17;
import 'package:mint_web/assembly/entity/user_model_from_dto.dart' as _i41;
import 'package:mint_web/assembly/entity/user_model_from_onboarding_specialist.dart'
    as _i8;
import 'package:mint_web/assembly/factory.dart' as _i3;
import 'package:mint_web/assembly/model/specialist_model_to_dto.dart' as _i11;
import 'package:mint_web/assembly/model/user_model_to_dto.dart' as _i43;
import 'package:mint_web/assembly/modified_user_dto_to_map.dart' as _i13;
import 'package:mint_web/data/model/patient_book_dto/patient_book_dto.dart'
    as _i15;
import 'package:mint_web/data/model/specialist_model_dto/specialist_model_dto.dart'
    as _i9;
import 'package:mint_web/data/model/user_model_dto/user_model_dto.dart' as _i12;
import 'package:mint_web/data/repository/abstract/booking_repository.dart'
    as _i36;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i19;
import 'package:mint_web/data/repository/abstract/specialist_repository.dart'
    as _i24;
import 'package:mint_web/data/repository/abstract/storage_repository.dart'
    as _i26;
import 'package:mint_web/data/repository/abstract/user_repository.dart' as _i31;
import 'package:mint_web/data/repository/firebase/firebase_booking_repository.dart'
    as _i37;
import 'package:mint_web/data/repository/firebase/firebase_initializer.dart'
    as _i18;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i20;
import 'package:mint_web/data/repository/firebase/firebase_specialist_repository.dart'
    as _i25;
import 'package:mint_web/data/repository/firebase/firebase_storage_repository.dart'
    as _i27;
import 'package:mint_web/data/repository/firebase/firebase_user_repository.dart'
    as _i32;
import 'package:mint_web/domain/controller/specialist_controller.dart' as _i23;
import 'package:mint_web/domain/controller/user_controller.dart' as _i30;
import 'package:mint_web/domain/entity/onboarding/onboarding.dart' as _i5;
import 'package:mint_web/domain/entity/onboarding_specialist/onboarding_specialist.dart'
    as _i4;
import 'package:mint_web/domain/entity/patient_book/patient_book.dart' as _i14;
import 'package:mint_web/domain/entity/specialist_model/specialist_model.dart'
    as _i10;
import 'package:mint_web/domain/entity/user_model/user_model.dart' as _i7;
import 'package:mint_web/domain/service/abstract/booking_service.dart' as _i38;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i21;
import 'package:mint_web/domain/service/abstract/specialist_service.dart'
    as _i46;
import 'package:mint_web/domain/service/abstract/storage_service.dart' as _i28;
import 'package:mint_web/domain/service/abstract/user_service.dart' as _i48;
import 'package:mint_web/domain/service/firebase/firebase_booking_service.dart'
    as _i39;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i22;
import 'package:mint_web/domain/service/firebase/firebase_specialist_service.dart'
    as _i47;
import 'package:mint_web/domain/service/firebase/firebase_storage_service.dart'
    as _i29;
import 'package:mint_web/domain/service/firebase/firebase_user_service.dart'
    as _i49;
import 'package:mint_web/domain/usecase/add_new_specialist_use_case.dart'
    as _i50;
import 'package:mint_web/domain/usecase/add_work_info_data_use_case.dart'
    as _i51;
import 'package:mint_web/domain/usecase/fetch_patient_book_list_use_case.dart'
    as _i44;
import 'package:mint_web/domain/usecase/fetch_specialist_data_use_case.dart'
    as _i52;
import 'package:mint_web/domain/usecase/fetch_specializations_use_case.dart'
    as _i53;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i54;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i55;
import 'package:mint_web/domain/usecase/update_user_data_use_case.dart' as _i58;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i33;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i34;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i35;
import 'package:mint_web/presentation/bloc/onboarding/onboarding_bloc.dart'
    as _i56;
import 'package:mint_web/presentation/bloc/patients/patients_bloc.dart' as _i45;
import 'package:mint_web/presentation/bloc/specialist/specialist_bloc.dart'
    as _i60;
import 'package:mint_web/presentation/bloc/specialist_info/specialist_info_bloc.dart'
    as _i57;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i59;

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
    gh.factory<_i3.Factory<_i4.OnboardingSpecialist?, _i5.Onboarding>>(
        () => _i6.OnboardingSpecialistFromOnboarding());
    gh.factory<_i3.Factory<_i7.UserModel, _i4.OnboardingSpecialist>>(
        () => _i8.UserModelFromOnboardingSpecialist());
    gh.factory<_i3.Factory<_i9.SpecialistModelDto, _i10.SpecialistModel>>(
        () => _i11.SpecialistModelToDto());
    gh.factory<_i3.Factory<Map<String, dynamic>, _i12.UserModelDto>>(
        () => _i13.ModifiedUserDtoToMap());
    gh.factory<_i3.Factory<_i14.PatientBook, _i15.PatientBookDto>>(
        () => _i16.UserModelFromOnboardingSpecialist());
    gh.factory<_i3.Factory<_i10.SpecialistModel, _i4.OnboardingSpecialist>>(
        () => _i17.SpecialistModelFromOnboardingSpecialist());
    gh.lazySingleton<_i18.FirebaseInitializer>(
        () => _i18.FirebaseInitializer());
    gh.lazySingleton<_i19.PhoneAuthRepository>(
        () => _i20.FirebasePhoneAuthRepository(gh<_i18.FirebaseInitializer>()));
    gh.factory<_i21.PhoneAuthService>(
        () => _i22.FirebasePhoneAuthService(gh<_i19.PhoneAuthRepository>()));
    gh.lazySingleton<_i23.SpecialistController>(
        () => _i23.SpecialistController());
    gh.factory<_i24.SpecialistRepository>(() =>
        _i25.FirebaseSpecialistRepository(gh<_i18.FirebaseInitializer>()));
    gh.factory<_i26.StorageRepository>(
        () => _i27.FirebaseStorageRepository(gh<_i18.FirebaseInitializer>()));
    gh.factory<_i28.StorageService>(
        () => _i29.FirebaseStorageService(gh<_i26.StorageRepository>()));
    gh.lazySingleton<_i30.UserController>(() => _i30.UserController());
    gh.factory<_i31.UserRepository>(() => _i32.FirebaseUserRepository(
          gh<_i18.FirebaseInitializer>(),
          gh<_i3.Factory<Map<String, dynamic>, _i12.UserModelDto>>(),
        ));
    gh.factory<_i33.VerifyOtpUseCase>(
        () => _i33.VerifyOtpUseCase(gh<_i21.PhoneAuthService>()));
    gh.factory<_i34.VerifyPhoneUseCase>(
        () => _i34.VerifyPhoneUseCase(gh<_i21.PhoneAuthService>()));
    gh.factory<_i35.AuthBloc>(() => _i35.AuthBloc(
          gh<_i34.VerifyPhoneUseCase>(),
          gh<_i33.VerifyOtpUseCase>(),
        ));
    gh.factory<_i36.BookingRepository>(
        () => _i37.FirebaseBookingRepository(gh<_i18.FirebaseInitializer>()));
    gh.factory<_i38.BookingService>(() => _i39.FirebaseBookingService(
          gh<_i36.BookingRepository>(),
          gh<_i3.Factory<_i14.PatientBook, _i15.PatientBookDto>>(),
        ));
    gh.factory<_i3.Factory<_i40.Future<_i7.UserModel>, _i12.UserModelDto>>(
        () => _i41.UserModelFromDto(gh<_i28.StorageService>()));
    gh.factory<
            _i3.Factory<_i40.Future<_i10.SpecialistModel>,
                _i9.SpecialistModelDto>>(
        () => _i42.SpecialistModelFromDto(gh<_i28.StorageService>()));
    gh.factory<_i3.Factory<_i40.Future<_i12.UserModelDto>, _i7.UserModel>>(
        () => _i43.UserModelToDto(gh<_i28.StorageService>()));
    gh.factory<_i44.FetchPatientBookListUseCase>(
        () => _i44.FetchPatientBookListUseCase(gh<_i38.BookingService>()));
    gh.factory<_i45.PatientsBloc>(() => _i45.PatientsBloc(
          gh<_i44.FetchPatientBookListUseCase>(),
          gh<_i30.UserController>(),
        ));
    gh.factory<_i46.SpecialistService>(() => _i47.FirebaseSpecialistService(
          gh<_i24.SpecialistRepository>(),
          gh<
              _i3.Factory<_i40.Future<_i10.SpecialistModel>,
                  _i9.SpecialistModelDto>>(),
          gh<_i3.Factory<_i9.SpecialistModelDto, _i10.SpecialistModel>>(),
        ));
    gh.factory<_i48.UserService>(() => _i49.FirebaseUserService(
          gh<_i31.UserRepository>(),
          gh<_i3.Factory<_i40.Future<_i7.UserModel>, _i12.UserModelDto>>(),
          gh<_i3.Factory<_i40.Future<_i12.UserModelDto>, _i7.UserModel>>(),
        ));
    gh.factory<_i50.AddSpecialistWithIdUseCase>(
        () => _i50.AddSpecialistWithIdUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i51.AddWorkInfoDataUseCase>(
        () => _i51.AddWorkInfoDataUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i52.FetchSpecialistDataUseCase>(
        () => _i52.FetchSpecialistDataUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i53.FetchSpecializationsUseCase>(
        () => _i53.FetchSpecializationsUseCase(gh<_i46.SpecialistService>()));
    gh.factory<_i54.FetchUserUseCase>(
        () => _i54.FetchUserUseCase(gh<_i48.UserService>()));
    gh.factory<_i55.LogOutUseCase>(
        () => _i55.LogOutUseCase(gh<_i48.UserService>()));
    gh.factory<_i56.OnboardingBloc>(
        () => _i56.OnboardingBloc(gh<_i53.FetchSpecializationsUseCase>()));
    gh.factory<_i57.SpecialistInfoBloc>(() => _i57.SpecialistInfoBloc(
          gh<_i52.FetchSpecialistDataUseCase>(),
          gh<_i23.SpecialistController>(),
          gh<_i30.UserController>(),
        ));
    gh.factory<_i58.UpdateUserDataUseCase>(
        () => _i58.UpdateUserDataUseCase(gh<_i48.UserService>()));
    gh.factory<_i59.UserBloc>(() => _i59.UserBloc(
          gh<_i30.UserController>(),
          gh<_i54.FetchUserUseCase>(),
          gh<_i55.LogOutUseCase>(),
        ));
    gh.factory<_i60.SpecialistBloc>(() => _i60.SpecialistBloc(
          gh<_i50.AddSpecialistWithIdUseCase>(),
          gh<_i58.UpdateUserDataUseCase>(),
          gh<_i51.AddWorkInfoDataUseCase>(),
          gh<_i3.Factory<_i4.OnboardingSpecialist?, _i5.Onboarding>>(),
          gh<_i3.Factory<_i10.SpecialistModel, _i4.OnboardingSpecialist>>(),
          gh<_i3.Factory<_i7.UserModel, _i4.OnboardingSpecialist>>(),
          gh<_i30.UserController>(),
          gh<_i23.SpecialistController>(),
        ));
    return this;
  }
}
