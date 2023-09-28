// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i46;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_core/mint_assembly.dart' as _i18;
import 'package:mint_core/mint_bloc.dart' as _i53;
import 'package:mint_core/mint_core.dart' as _i19;
import 'package:mint_core/mint_module.dart' as _i3;
import 'package:mint_web/assembly/entity/onboarding_specialist_from_onboarding.dart'
    as _i23;
import 'package:mint_web/assembly/entity/patient_book_from_dto.dart' as _i27;
import 'package:mint_web/assembly/entity/specialist_model_from_onboarding_specialist.dart'
    as _i24;
import 'package:mint_web/assembly/entity/user_model_from_onboarding_specialist.dart'
    as _i21;
import 'package:mint_web/data/model/patient_book_dto/patient_book_dto.dart'
    as _i26;
import 'package:mint_web/data/repository/abstract/audio_playback_repository.dart'
    as _i4;
import 'package:mint_web/data/repository/abstract/audio_record_repository.dart'
    as _i8;
import 'package:mint_web/data/repository/abstract/booking_repository.dart'
    as _i13;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i35;
import 'package:mint_web/data/repository/abstract/specialist_repository.dart'
    as _i42;
import 'package:mint_web/data/repository/audio_playback_repository_impl.dart'
    as _i5;
import 'package:mint_web/data/repository/audio_record_repository_impl.dart'
    as _i9;
import 'package:mint_web/data/repository/firebase/firebase_booking_repository.dart'
    as _i14;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i36;
import 'package:mint_web/data/repository/firebase/firebase_specialist_repository.dart'
    as _i43;
import 'package:mint_web/domain/controller/booking_controller.dart' as _i12;
import 'package:mint_web/domain/controller/specialist_controller.dart' as _i41;
import 'package:mint_web/domain/entity/onboarding/onboarding.dart' as _i22;
import 'package:mint_web/domain/entity/onboarding_specialist/onboarding_specialist.dart'
    as _i20;
import 'package:mint_web/domain/entity/patient_book/patient_book.dart' as _i25;
import 'package:mint_web/domain/service/abstract/audio_playback_service.dart'
    as _i6;
import 'package:mint_web/domain/service/abstract/audio_record_service.dart'
    as _i10;
import 'package:mint_web/domain/service/abstract/booking_service.dart' as _i61;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i37;
import 'package:mint_web/domain/service/abstract/specialist_service.dart'
    as _i44;
import 'package:mint_web/domain/service/audio_playback_service_impl.dart'
    as _i7;
import 'package:mint_web/domain/service/audio_record_service_impl.dart' as _i11;
import 'package:mint_web/domain/service/firebase/firebase_booking_service.dart'
    as _i62;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i38;
import 'package:mint_web/domain/service/firebase/firebase_specialist_service.dart'
    as _i45;
import 'package:mint_web/domain/usecase/add_new_specialist_use_case.dart'
    as _i56;
import 'package:mint_web/domain/usecase/add_work_info_data_use_case.dart'
    as _i57;
import 'package:mint_web/domain/usecase/dispose_player_use_case.dart' as _i16;
import 'package:mint_web/domain/usecase/dispose_recorder_use_case.dart' as _i17;
import 'package:mint_web/domain/usecase/fetch_patient_book_list_use_case.dart'
    as _i63;
import 'package:mint_web/domain/usecase/fetch_specialist_data_use_case.dart'
    as _i64;
import 'package:mint_web/domain/usecase/fetch_specializations_use_case.dart'
    as _i65;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i28;
import 'package:mint_web/domain/usecase/get_player_position_stream_use_case.dart'
    as _i29;
import 'package:mint_web/domain/usecase/get_player_state_stream_use_case.dart'
    as _i30;
import 'package:mint_web/domain/usecase/get_record_duration_stream_use_case.dart'
    as _i31;
import 'package:mint_web/domain/usecase/initialize_recorder_use_case.dart'
    as _i32;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i33;
import 'package:mint_web/domain/usecase/pause_player_use_case.dart' as _i34;
import 'package:mint_web/domain/usecase/resume_player_use_case.dart' as _i39;
import 'package:mint_web/domain/usecase/seek_player_use_case.dart' as _i40;
import 'package:mint_web/domain/usecase/start_player_use_case.dart' as _i47;
import 'package:mint_web/domain/usecase/start_recorder_use_case.dart' as _i48;
import 'package:mint_web/domain/usecase/stop_player_use_case.dart' as _i49;
import 'package:mint_web/domain/usecase/stop_recorder_use_case.dart' as _i50;
import 'package:mint_web/domain/usecase/update_user_data_use_case.dart' as _i51;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i54;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i55;
import 'package:mint_web/presentation/bloc/appointments/appointments_bloc.dart'
    as _i70;
import 'package:mint_web/presentation/bloc/audio_player/audio_player_bloc.dart'
    as _i58;
import 'package:mint_web/presentation/bloc/audio_record/audio_record_bloc.dart'
    as _i59;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i60;
import 'package:mint_web/presentation/bloc/chat_presence/chat_presence_bloc.dart'
    as _i15;
import 'package:mint_web/presentation/bloc/onboarding/onboarding_bloc.dart'
    as _i66;
import 'package:mint_web/presentation/bloc/patients/patients_bloc.dart' as _i67;
import 'package:mint_web/presentation/bloc/specialist/specialist_bloc.dart'
    as _i68;
import 'package:mint_web/presentation/bloc/specialist_info/specialist_info_bloc.dart'
    as _i69;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i52;

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
    gh.lazySingleton<_i4.AudioPlaybackRepository>(
        () => _i5.AudioPlaybackRepositoryImpl());
    gh.factory<_i6.AudioPlaybackService>(
        () => _i7.AudioPlaybackServiceImpl(gh<_i4.AudioPlaybackRepository>()));
    gh.lazySingleton<_i8.AudioRecordRepository>(
        () => _i9.AudioRecordRepositoryImpl());
    gh.factory<_i10.AudioRecordService>(
        () => _i11.AudioRecordServiceImpl(gh<_i8.AudioRecordRepository>()));
    gh.lazySingleton<_i12.BookingController>(() => _i12.BookingController());
    gh.factory<_i13.BookingRepository>(
        () => _i14.FirebaseBookingRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i15.ChatPresenceBloc>(
        () => _i15.ChatPresenceBloc(gh<_i3.GetUserPresenceUseCase>()));
    gh.factory<_i16.DisposePlayerUseCase>(
        () => _i16.DisposePlayerUseCase(gh<_i6.AudioPlaybackService>()));
    gh.factory<_i17.DisposeRecorderUseCase>(
        () => _i17.DisposeRecorderUseCase(gh<_i10.AudioRecordService>()));
    gh.factory<_i18.Factory<_i19.UserModel, _i20.OnboardingSpecialist>>(
        () => _i21.UserModelFromOnboardingSpecialist());
    gh.factory<_i18.Factory<_i20.OnboardingSpecialist?, _i22.Onboarding>>(
        () => _i23.OnboardingSpecialistFromOnboarding());
    gh.factory<_i18.Factory<_i19.SpecialistModel, _i20.OnboardingSpecialist>>(
        () => _i24.SpecialistModelFromOnboardingSpecialist());
    gh.factory<_i18.Factory<_i25.PatientBook, _i26.PatientBookDto>>(
        () => _i27.UserModelFromOnboardingSpecialist());
    gh.factory<_i28.FetchUserUseCase>(
        () => _i28.FetchUserUseCase(gh<_i3.UserService>()));
    gh.factory<_i29.GetPlayerPositionStreamUseCase>(() =>
        _i29.GetPlayerPositionStreamUseCase(gh<_i6.AudioPlaybackService>()));
    gh.factory<_i30.GetPlayerStateStreamUseCase>(
        () => _i30.GetPlayerStateStreamUseCase(gh<_i6.AudioPlaybackService>()));
    gh.factory<_i31.GetRecordDurationStreamUseCase>(() =>
        _i31.GetRecordDurationStreamUseCase(gh<_i10.AudioRecordService>()));
    gh.factory<_i32.InitializeRecorderUseCase>(
        () => _i32.InitializeRecorderUseCase(gh<_i10.AudioRecordService>()));
    gh.factory<_i33.LogOutUseCase>(
        () => _i33.LogOutUseCase(gh<_i3.UserService>()));
    gh.factory<_i34.PausePlayerUseCase>(
        () => _i34.PausePlayerUseCase(gh<_i6.AudioPlaybackService>()));
    gh.lazySingleton<_i35.PhoneAuthRepository>(
        () => _i36.FirebasePhoneAuthRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i37.PhoneAuthService>(
        () => _i38.FirebasePhoneAuthService(gh<_i35.PhoneAuthRepository>()));
    gh.factory<_i39.ResumePlayerUseCase>(
        () => _i39.ResumePlayerUseCase(gh<_i6.AudioPlaybackService>()));
    gh.factory<_i40.SeekPlayerUseCase>(
        () => _i40.SeekPlayerUseCase(gh<_i6.AudioPlaybackService>()));
    gh.lazySingleton<_i41.SpecialistController>(
        () => _i41.SpecialistController());
    gh.factory<_i42.SpecialistRepository>(
        () => _i43.FirebaseSpecialistRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i44.SpecialistService>(() => _i45.FirebaseSpecialistService(
          gh<_i42.SpecialistRepository>(),
          gh<
              _i18.Factory<_i46.Future<_i19.SpecialistModel>,
                  _i19.SpecialistModelDto>>(),
          gh<_i18.Factory<_i19.SpecialistModelDto, _i19.SpecialistModel>>(),
        ));
    gh.factory<_i47.StartPlayerUseCase>(
        () => _i47.StartPlayerUseCase(gh<_i6.AudioPlaybackService>()));
    gh.factory<_i48.StartRecorderUseCase>(
        () => _i48.StartRecorderUseCase(gh<_i10.AudioRecordService>()));
    gh.factory<_i49.StopPlayerUseCase>(
        () => _i49.StopPlayerUseCase(gh<_i6.AudioPlaybackService>()));
    gh.factory<_i50.StopRecorderUseCase>(
        () => _i50.StopRecorderUseCase(gh<_i10.AudioRecordService>()));
    gh.factory<_i51.UpdateUserDataUseCase>(
        () => _i51.UpdateUserDataUseCase(gh<_i3.UserService>()));
    gh.factory<_i52.UserBloc>(() => _i52.UserBloc(
          gh<_i53.UserController<_i19.UserModel?>>(),
          gh<_i28.FetchUserUseCase>(),
          gh<_i33.LogOutUseCase>(),
          gh<_i3.InitializeUserPresenceUseCase>(),
        ));
    gh.factory<_i54.VerifyOtpUseCase>(
        () => _i54.VerifyOtpUseCase(gh<_i37.PhoneAuthService>()));
    gh.factory<_i55.VerifyPhoneUseCase>(
        () => _i55.VerifyPhoneUseCase(gh<_i37.PhoneAuthService>()));
    gh.factory<_i56.AddSpecialistWithIdUseCase>(
        () => _i56.AddSpecialistWithIdUseCase(gh<_i44.SpecialistService>()));
    gh.factory<_i57.AddWorkInfoDataUseCase>(
        () => _i57.AddWorkInfoDataUseCase(gh<_i44.SpecialistService>()));
    gh.factory<_i58.AudioPlayerBloc>(() => _i58.AudioPlayerBloc(
          gh<_i47.StartPlayerUseCase>(),
          gh<_i39.ResumePlayerUseCase>(),
          gh<_i29.GetPlayerPositionStreamUseCase>(),
          gh<_i30.GetPlayerStateStreamUseCase>(),
          gh<_i40.SeekPlayerUseCase>(),
          gh<_i34.PausePlayerUseCase>(),
          gh<_i49.StopPlayerUseCase>(),
          gh<_i16.DisposePlayerUseCase>(),
        ));
    gh.factory<_i59.AudioRecordBloc>(() => _i59.AudioRecordBloc(
          gh<_i32.InitializeRecorderUseCase>(),
          gh<_i48.StartRecorderUseCase>(),
          gh<_i31.GetRecordDurationStreamUseCase>(),
          gh<_i50.StopRecorderUseCase>(),
          gh<_i17.DisposeRecorderUseCase>(),
        ));
    gh.factory<_i60.AuthBloc>(() => _i60.AuthBloc(
          gh<_i55.VerifyPhoneUseCase>(),
          gh<_i54.VerifyOtpUseCase>(),
        ));
    gh.factory<_i61.BookingService>(() => _i62.FirebaseBookingService(
          gh<_i13.BookingRepository>(),
          gh<_i18.Factory<_i25.PatientBook, _i26.PatientBookDto>>(),
        ));
    gh.factory<_i63.FetchPatientBookListUseCase>(
        () => _i63.FetchPatientBookListUseCase(gh<_i61.BookingService>()));
    gh.factory<_i64.FetchSpecialistDataUseCase>(
        () => _i64.FetchSpecialistDataUseCase(gh<_i44.SpecialistService>()));
    gh.factory<_i65.FetchSpecializationsUseCase>(
        () => _i65.FetchSpecializationsUseCase(gh<_i44.SpecialistService>()));
    gh.factory<_i66.OnboardingBloc>(
        () => _i66.OnboardingBloc(gh<_i65.FetchSpecializationsUseCase>()));
    gh.factory<_i67.PatientsBloc>(() => _i67.PatientsBloc(
          gh<_i63.FetchPatientBookListUseCase>(),
          gh<_i53.UserController<_i19.UserModel?>>(),
          gh<_i12.BookingController>(),
        ));
    gh.factory<_i68.SpecialistBloc>(() => _i68.SpecialistBloc(
          gh<_i56.AddSpecialistWithIdUseCase>(),
          gh<_i51.UpdateUserDataUseCase>(),
          gh<_i57.AddWorkInfoDataUseCase>(),
          gh<_i18.Factory<_i20.OnboardingSpecialist?, _i22.Onboarding>>(),
          gh<_i18.Factory<_i19.SpecialistModel, _i20.OnboardingSpecialist>>(),
          gh<_i18.Factory<_i19.UserModel, _i20.OnboardingSpecialist>>(),
          gh<_i53.UserController<_i19.UserModel?>>(),
          gh<_i41.SpecialistController>(),
        ));
    gh.factory<_i69.SpecialistInfoBloc>(() => _i69.SpecialistInfoBloc(
          gh<_i64.FetchSpecialistDataUseCase>(),
          gh<_i41.SpecialistController>(),
          gh<_i53.UserController<_i19.UserModel?>>(),
        ));
    gh.factory<_i70.AppointmentsBloc>(() => _i70.AppointmentsBloc(
          gh<_i63.FetchPatientBookListUseCase>(),
          gh<_i53.UserController<_i19.UserModel?>>(),
          gh<_i12.BookingController>(),
          gh<_i3.GetExcludedDaysByIdUseCase>(),
        ));
    return this;
  }
}
