// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i28;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_core/mint_assembly.dart' as _i6;
import 'package:mint_core/mint_bloc.dart' as _i31;
import 'package:mint_core/mint_core.dart' as _i7;
import 'package:mint_core/mint_module.dart' as _i3;
import 'package:mint_web/assembly/entity/onboarding_specialist_from_onboarding.dart'
    as _i11;
import 'package:mint_web/assembly/entity/patient_book_from_dto.dart' as _i15;
import 'package:mint_web/assembly/entity/specialist_model_from_onboarding_specialist.dart'
    as _i12;
import 'package:mint_web/assembly/entity/user_model_from_onboarding_specialist.dart'
    as _i9;
import 'package:mint_web/data/model/patient_book_dto/patient_book_dto.dart'
    as _i14;
import 'package:mint_web/data/repository/abstract/booking_repository.dart'
    as _i4;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i19;
import 'package:mint_web/data/repository/abstract/specialist_repository.dart'
    as _i24;
import 'package:mint_web/data/repository/firebase/firebase_booking_repository.dart'
    as _i5;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i20;
import 'package:mint_web/data/repository/firebase/firebase_specialist_repository.dart'
    as _i25;
import 'package:mint_web/domain/controller/specialist_controller.dart' as _i23;
import 'package:mint_web/domain/entity/onboarding/onboarding.dart' as _i10;
import 'package:mint_web/domain/entity/onboarding_specialist/onboarding_specialist.dart'
    as _i8;
import 'package:mint_web/domain/entity/patient_book/patient_book.dart' as _i13;
import 'package:mint_web/domain/service/abstract/booking_service.dart' as _i37;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i21;
import 'package:mint_web/domain/service/abstract/specialist_service.dart'
    as _i26;
import 'package:mint_web/domain/service/firebase/firebase_booking_service.dart'
    as _i38;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i22;
import 'package:mint_web/domain/service/firebase/firebase_specialist_service.dart'
    as _i27;
import 'package:mint_web/domain/usecase/add_new_specialist_use_case.dart'
    as _i34;
import 'package:mint_web/domain/usecase/add_work_info_data_use_case.dart'
    as _i35;
import 'package:mint_web/domain/usecase/fetch_chat_room_list_use_case.dart'
    as _i16;
import 'package:mint_web/domain/usecase/fetch_patient_book_list_use_case.dart'
    as _i40;
import 'package:mint_web/domain/usecase/fetch_specialist_data_use_case.dart'
    as _i41;
import 'package:mint_web/domain/usecase/fetch_specializations_use_case.dart'
    as _i42;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i17;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i18;
import 'package:mint_web/domain/usecase/update_user_data_use_case.dart' as _i29;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i32;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i33;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i36;
import 'package:mint_web/presentation/bloc/chat_room/chat_room_bloc.dart'
    as _i39;
import 'package:mint_web/presentation/bloc/onboarding/onboarding_bloc.dart'
    as _i43;
import 'package:mint_web/presentation/bloc/patients/patients_bloc.dart' as _i44;
import 'package:mint_web/presentation/bloc/specialist/specialist_bloc.dart'
    as _i45;
import 'package:mint_web/presentation/bloc/specialist_info/specialist_info_bloc.dart'
    as _i46;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i30;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.MintCorePackageModule().init(gh);
    gh.factory<_i4.BookingRepository>(
        () => _i5.FirebaseBookingRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i6.Factory<_i7.UserModel, _i8.OnboardingSpecialist>>(
        () => _i9.UserModelFromOnboardingSpecialist());
    gh.factory<_i6.Factory<_i8.OnboardingSpecialist?, _i10.Onboarding>>(
        () => _i11.OnboardingSpecialistFromOnboarding());
    gh.factory<_i6.Factory<_i7.SpecialistModel, _i8.OnboardingSpecialist>>(
        () => _i12.SpecialistModelFromOnboardingSpecialist());
    gh.factory<_i6.Factory<_i13.PatientBook, _i14.PatientBookDto>>(
        () => _i15.UserModelFromOnboardingSpecialist());
    gh.factory<_i16.FetchChatRoomListUseCase>(
        () => _i16.FetchChatRoomListUseCase(gh<_i3.ChatService>()));
    gh.factory<_i17.FetchUserUseCase>(
        () => _i17.FetchUserUseCase(gh<_i3.UserService>()));
    gh.factory<_i18.LogOutUseCase>(
        () => _i18.LogOutUseCase(gh<_i3.UserService>()));
    gh.lazySingleton<_i19.PhoneAuthRepository>(
        () => _i20.FirebasePhoneAuthRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i21.PhoneAuthService>(
        () => _i22.FirebasePhoneAuthService(gh<_i19.PhoneAuthRepository>()));
    gh.lazySingleton<_i23.SpecialistController>(
        () => _i23.SpecialistController());
    gh.factory<_i24.SpecialistRepository>(
        () => _i25.FirebaseSpecialistRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i26.SpecialistService>(() => _i27.FirebaseSpecialistService(
          gh<_i24.SpecialistRepository>(),
          gh<
              _i6.Factory<_i28.Future<_i7.SpecialistModel>,
                  _i7.SpecialistModelDto>>(),
          gh<_i6.Factory<_i7.SpecialistModelDto, _i7.SpecialistModel>>(),
        ));
    gh.factory<_i29.UpdateUserDataUseCase>(
        () => _i29.UpdateUserDataUseCase(gh<_i3.UserService>()));
    gh.factory<_i30.UserBloc>(() => _i30.UserBloc(
          gh<_i31.UserController<_i7.UserModel?>>(),
          gh<_i17.FetchUserUseCase>(),
          gh<_i18.LogOutUseCase>(),
        ));
    gh.factory<_i32.VerifyOtpUseCase>(
        () => _i32.VerifyOtpUseCase(gh<_i21.PhoneAuthService>()));
    gh.factory<_i33.VerifyPhoneUseCase>(
        () => _i33.VerifyPhoneUseCase(gh<_i21.PhoneAuthService>()));
    gh.factory<_i34.AddSpecialistWithIdUseCase>(
        () => _i34.AddSpecialistWithIdUseCase(gh<_i26.SpecialistService>()));
    gh.factory<_i35.AddWorkInfoDataUseCase>(
        () => _i35.AddWorkInfoDataUseCase(gh<_i26.SpecialistService>()));
    gh.factory<_i36.AuthBloc>(() => _i36.AuthBloc(
          gh<_i33.VerifyPhoneUseCase>(),
          gh<_i32.VerifyOtpUseCase>(),
        ));
    gh.factory<_i37.BookingService>(() => _i38.FirebaseBookingService(
          gh<_i4.BookingRepository>(),
          gh<_i6.Factory<_i13.PatientBook, _i14.PatientBookDto>>(),
        ));
    gh.factory<_i39.ChatRoomBloc>(() => _i39.ChatRoomBloc(
          gh<_i16.FetchChatRoomListUseCase>(),
          gh<_i31.UserController<_i7.UserModel?>>(),
        ));
    gh.factory<_i40.FetchPatientBookListUseCase>(
        () => _i40.FetchPatientBookListUseCase(gh<_i37.BookingService>()));
    gh.factory<_i41.FetchSpecialistDataUseCase>(
        () => _i41.FetchSpecialistDataUseCase(gh<_i26.SpecialistService>()));
    gh.factory<_i42.FetchSpecializationsUseCase>(
        () => _i42.FetchSpecializationsUseCase(gh<_i26.SpecialistService>()));
    gh.factory<_i43.OnboardingBloc>(
        () => _i43.OnboardingBloc(gh<_i42.FetchSpecializationsUseCase>()));
    gh.factory<_i44.PatientsBloc>(() => _i44.PatientsBloc(
          gh<_i40.FetchPatientBookListUseCase>(),
          gh<_i31.UserController<_i7.UserModel?>>(),
        ));
    gh.factory<_i45.SpecialistBloc>(() => _i45.SpecialistBloc(
          gh<_i34.AddSpecialistWithIdUseCase>(),
          gh<_i29.UpdateUserDataUseCase>(),
          gh<_i35.AddWorkInfoDataUseCase>(),
          gh<_i6.Factory<_i8.OnboardingSpecialist?, _i10.Onboarding>>(),
          gh<_i6.Factory<_i7.SpecialistModel, _i8.OnboardingSpecialist>>(),
          gh<_i6.Factory<_i7.UserModel, _i8.OnboardingSpecialist>>(),
          gh<_i31.UserController<_i7.UserModel?>>(),
          gh<_i23.SpecialistController>(),
        ));
    gh.factory<_i46.SpecialistInfoBloc>(() => _i46.SpecialistInfoBloc(
          gh<_i41.FetchSpecialistDataUseCase>(),
          gh<_i23.SpecialistController>(),
          gh<_i31.UserController<_i7.UserModel?>>(),
        ));
    return this;
  }
}
