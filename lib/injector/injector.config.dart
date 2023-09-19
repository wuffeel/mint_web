// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i36;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_core/mint_assembly.dart' as _i12;
import 'package:mint_core/mint_bloc.dart' as _i42;
import 'package:mint_core/mint_core.dart' as _i13;
import 'package:mint_core/mint_module.dart' as _i3;
import 'package:mint_web/assembly/entity/onboarding_specialist_from_onboarding.dart'
    as _i17;
import 'package:mint_web/assembly/entity/patient_book_from_dto.dart' as _i21;
import 'package:mint_web/assembly/entity/specialist_model_from_onboarding_specialist.dart'
    as _i18;
import 'package:mint_web/assembly/entity/user_model_from_onboarding_specialist.dart'
    as _i15;
import 'package:mint_web/data/model/patient_book_dto/patient_book_dto.dart'
    as _i20;
import 'package:mint_web/data/repository/abstract/audio_record_repository.dart'
    as _i4;
import 'package:mint_web/data/repository/abstract/booking_repository.dart'
    as _i8;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i27;
import 'package:mint_web/data/repository/abstract/specialist_repository.dart'
    as _i32;
import 'package:mint_web/data/repository/audio_record_repository_impl.dart'
    as _i5;
import 'package:mint_web/data/repository/firebase/firebase_booking_repository.dart'
    as _i9;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i28;
import 'package:mint_web/data/repository/firebase/firebase_specialist_repository.dart'
    as _i33;
import 'package:mint_web/domain/controller/specialist_controller.dart' as _i31;
import 'package:mint_web/domain/entity/onboarding/onboarding.dart' as _i16;
import 'package:mint_web/domain/entity/onboarding_specialist/onboarding_specialist.dart'
    as _i14;
import 'package:mint_web/domain/entity/patient_book/patient_book.dart' as _i19;
import 'package:mint_web/domain/service/abstract/audio_record_service.dart'
    as _i6;
import 'package:mint_web/domain/service/abstract/booking_service.dart' as _i49;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i29;
import 'package:mint_web/domain/service/abstract/specialist_service.dart'
    as _i34;
import 'package:mint_web/domain/service/audio_record_service_impl.dart' as _i7;
import 'package:mint_web/domain/service/firebase/firebase_booking_service.dart'
    as _i50;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i30;
import 'package:mint_web/domain/service/firebase/firebase_specialist_service.dart'
    as _i35;
import 'package:mint_web/domain/usecase/add_new_specialist_use_case.dart'
    as _i45;
import 'package:mint_web/domain/usecase/add_work_info_data_use_case.dart'
    as _i46;
import 'package:mint_web/domain/usecase/dispose_recorder_use_case.dart' as _i11;
import 'package:mint_web/domain/usecase/fetch_chat_room_list_use_case.dart'
    as _i22;
import 'package:mint_web/domain/usecase/fetch_patient_book_list_use_case.dart'
    as _i52;
import 'package:mint_web/domain/usecase/fetch_specialist_data_use_case.dart'
    as _i53;
import 'package:mint_web/domain/usecase/fetch_specializations_use_case.dart'
    as _i54;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i23;
import 'package:mint_web/domain/usecase/get_record_duration_stream_use_case.dart'
    as _i24;
import 'package:mint_web/domain/usecase/initialize_recorder_use_case.dart'
    as _i25;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i26;
import 'package:mint_web/domain/usecase/start_recorder_use_case.dart' as _i37;
import 'package:mint_web/domain/usecase/stop_recorder_use_case.dart' as _i38;
import 'package:mint_web/domain/usecase/update_user_data_use_case.dart' as _i40;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i43;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i44;
import 'package:mint_web/presentation/bloc/audio_record/audio_record_bloc.dart'
    as _i47;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i48;
import 'package:mint_web/presentation/bloc/chat_presence/chat_presence_bloc.dart'
    as _i10;
import 'package:mint_web/presentation/bloc/chat_room/chat_room_bloc.dart'
    as _i51;
import 'package:mint_web/presentation/bloc/onboarding/onboarding_bloc.dart'
    as _i55;
import 'package:mint_web/presentation/bloc/patients/patients_bloc.dart' as _i56;
import 'package:mint_web/presentation/bloc/specialist/specialist_bloc.dart'
    as _i57;
import 'package:mint_web/presentation/bloc/specialist_info/specialist_info_bloc.dart'
    as _i58;
import 'package:mint_web/presentation/bloc/unread_messages/unread_messages_bloc.dart'
    as _i39;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i41;

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
    gh.lazySingleton<_i4.AudioRecordRepository>(
        () => _i5.AudioRecordRepositoryImpl());
    gh.factory<_i6.AudioRecordService>(
        () => _i7.AudioRecordServiceImpl(gh<_i4.AudioRecordRepository>()));
    gh.factory<_i8.BookingRepository>(
        () => _i9.FirebaseBookingRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i10.ChatPresenceBloc>(
        () => _i10.ChatPresenceBloc(gh<_i3.GetUserPresenceUseCase>()));
    gh.factory<_i11.DisposeRecorderUseCase>(
        () => _i11.DisposeRecorderUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i12.Factory<_i13.UserModel, _i14.OnboardingSpecialist>>(
        () => _i15.UserModelFromOnboardingSpecialist());
    gh.factory<_i12.Factory<_i14.OnboardingSpecialist?, _i16.Onboarding>>(
        () => _i17.OnboardingSpecialistFromOnboarding());
    gh.factory<_i12.Factory<_i13.SpecialistModel, _i14.OnboardingSpecialist>>(
        () => _i18.SpecialistModelFromOnboardingSpecialist());
    gh.factory<_i12.Factory<_i19.PatientBook, _i20.PatientBookDto>>(
        () => _i21.UserModelFromOnboardingSpecialist());
    gh.factory<_i22.FetchChatRoomListUseCase>(
        () => _i22.FetchChatRoomListUseCase(gh<_i3.ChatService>()));
    gh.factory<_i23.FetchUserUseCase>(
        () => _i23.FetchUserUseCase(gh<_i3.UserService>()));
    gh.factory<_i24.GetRecordDurationStreamUseCase>(() =>
        _i24.GetRecordDurationStreamUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i25.InitializeRecorderUseCase>(
        () => _i25.InitializeRecorderUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i26.LogOutUseCase>(
        () => _i26.LogOutUseCase(gh<_i3.UserService>()));
    gh.lazySingleton<_i27.PhoneAuthRepository>(
        () => _i28.FirebasePhoneAuthRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i29.PhoneAuthService>(
        () => _i30.FirebasePhoneAuthService(gh<_i27.PhoneAuthRepository>()));
    gh.lazySingleton<_i31.SpecialistController>(
        () => _i31.SpecialistController());
    gh.factory<_i32.SpecialistRepository>(
        () => _i33.FirebaseSpecialistRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i34.SpecialistService>(() => _i35.FirebaseSpecialistService(
          gh<_i32.SpecialistRepository>(),
          gh<
              _i12.Factory<_i36.Future<_i13.SpecialistModel>,
                  _i13.SpecialistModelDto>>(),
          gh<_i12.Factory<_i13.SpecialistModelDto, _i13.SpecialistModel>>(),
        ));
    gh.factory<_i37.StartRecorderUseCase>(
        () => _i37.StartRecorderUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i38.StopRecorderUseCase>(
        () => _i38.StopRecorderUseCase(gh<_i6.AudioRecordService>()));
    gh.factory<_i39.UnreadMessagesBloc>(() =>
        _i39.UnreadMessagesBloc(gh<_i3.FetchUnreadMessagesCountUseCase>()));
    gh.factory<_i40.UpdateUserDataUseCase>(
        () => _i40.UpdateUserDataUseCase(gh<_i3.UserService>()));
    gh.factory<_i41.UserBloc>(() => _i41.UserBloc(
          gh<_i42.UserController<_i13.UserModel?>>(),
          gh<_i23.FetchUserUseCase>(),
          gh<_i26.LogOutUseCase>(),
          gh<_i3.InitializeUserPresenceUseCase>(),
        ));
    gh.factory<_i43.VerifyOtpUseCase>(
        () => _i43.VerifyOtpUseCase(gh<_i29.PhoneAuthService>()));
    gh.factory<_i44.VerifyPhoneUseCase>(
        () => _i44.VerifyPhoneUseCase(gh<_i29.PhoneAuthService>()));
    gh.factory<_i45.AddSpecialistWithIdUseCase>(
        () => _i45.AddSpecialistWithIdUseCase(gh<_i34.SpecialistService>()));
    gh.factory<_i46.AddWorkInfoDataUseCase>(
        () => _i46.AddWorkInfoDataUseCase(gh<_i34.SpecialistService>()));
    gh.factory<_i47.AudioRecordBloc>(() => _i47.AudioRecordBloc(
          gh<_i25.InitializeRecorderUseCase>(),
          gh<_i37.StartRecorderUseCase>(),
          gh<_i24.GetRecordDurationStreamUseCase>(),
          gh<_i38.StopRecorderUseCase>(),
          gh<_i11.DisposeRecorderUseCase>(),
        ));
    gh.factory<_i48.AuthBloc>(() => _i48.AuthBloc(
          gh<_i44.VerifyPhoneUseCase>(),
          gh<_i43.VerifyOtpUseCase>(),
        ));
    gh.factory<_i49.BookingService>(() => _i50.FirebaseBookingService(
          gh<_i8.BookingRepository>(),
          gh<_i12.Factory<_i19.PatientBook, _i20.PatientBookDto>>(),
        ));
    gh.factory<_i51.ChatRoomBloc>(() => _i51.ChatRoomBloc(
          gh<_i22.FetchChatRoomListUseCase>(),
          gh<_i42.UserController<_i13.UserModel?>>(),
        ));
    gh.factory<_i52.FetchPatientBookListUseCase>(
        () => _i52.FetchPatientBookListUseCase(gh<_i49.BookingService>()));
    gh.factory<_i53.FetchSpecialistDataUseCase>(
        () => _i53.FetchSpecialistDataUseCase(gh<_i34.SpecialistService>()));
    gh.factory<_i54.FetchSpecializationsUseCase>(
        () => _i54.FetchSpecializationsUseCase(gh<_i34.SpecialistService>()));
    gh.factory<_i55.OnboardingBloc>(
        () => _i55.OnboardingBloc(gh<_i54.FetchSpecializationsUseCase>()));
    gh.factory<_i56.PatientsBloc>(() => _i56.PatientsBloc(
          gh<_i52.FetchPatientBookListUseCase>(),
          gh<_i42.UserController<_i13.UserModel?>>(),
        ));
    gh.factory<_i57.SpecialistBloc>(() => _i57.SpecialistBloc(
          gh<_i45.AddSpecialistWithIdUseCase>(),
          gh<_i40.UpdateUserDataUseCase>(),
          gh<_i46.AddWorkInfoDataUseCase>(),
          gh<_i12.Factory<_i14.OnboardingSpecialist?, _i16.Onboarding>>(),
          gh<_i12.Factory<_i13.SpecialistModel, _i14.OnboardingSpecialist>>(),
          gh<_i12.Factory<_i13.UserModel, _i14.OnboardingSpecialist>>(),
          gh<_i42.UserController<_i13.UserModel?>>(),
          gh<_i31.SpecialistController>(),
        ));
    gh.factory<_i58.SpecialistInfoBloc>(() => _i58.SpecialistInfoBloc(
          gh<_i53.FetchSpecialistDataUseCase>(),
          gh<_i31.SpecialistController>(),
          gh<_i42.UserController<_i13.UserModel?>>(),
        ));
    return this;
  }
}
