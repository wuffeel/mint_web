// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i56;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mint_core/mint_assembly.dart' as _i25;
import 'package:mint_core/mint_bloc.dart' as _i9;
import 'package:mint_core/mint_core.dart' as _i10;
import 'package:mint_core/mint_module.dart' as _i3;
import 'package:mint_core/src/domain/use_case/clear_app_notifications_use_case.dart'
    as _i8;
import 'package:mint_core/src/domain/use_case/fetch_chat_room_use_case.dart'
    as _i6;
import 'package:mint_core/src/domain/use_case/get_app_notification_stream_use_case.dart'
    as _i5;
import 'package:mint_core/src/domain/use_case/mark_app_notification_as_read_use_case.dart'
    as _i7;
import 'package:mint_web/assembly/entity/onboarding_specialist_from_onboarding.dart'
    as _i28;
import 'package:mint_web/assembly/entity/patient_book_from_dto.dart' as _i34;
import 'package:mint_web/assembly/entity/specialist_model_from_onboarding_specialist.dart'
    as _i31;
import 'package:mint_web/assembly/entity/specialist_profile_from_model.dart'
    as _i30;
import 'package:mint_web/assembly/entity/user_model_from_onboarding_specialist.dart'
    as _i35;
import 'package:mint_web/assembly/model/specialist_profile_model_to_dto.dart'
    as _i37;
import 'package:mint_web/data/model/patient_book_dto/patient_book_dto.dart'
    as _i33;
import 'package:mint_web/data/model/specialist_profile_model_dto/specialist_profile_model_dto.dart'
    as _i36;
import 'package:mint_web/data/repository/abstract/audio_playback_repository.dart'
    as _i11;
import 'package:mint_web/data/repository/abstract/audio_record_repository.dart'
    as _i15;
import 'package:mint_web/data/repository/abstract/booking_repository.dart'
    as _i20;
import 'package:mint_web/data/repository/abstract/phone_auth_repository.dart'
    as _i45;
import 'package:mint_web/data/repository/abstract/specialist_repository.dart'
    as _i52;
import 'package:mint_web/data/repository/audio_playback_repository_impl.dart'
    as _i12;
import 'package:mint_web/data/repository/audio_record_repository_impl.dart'
    as _i16;
import 'package:mint_web/data/repository/firebase/firebase_booking_repository.dart'
    as _i21;
import 'package:mint_web/data/repository/firebase/firebase_phone_auth_repository.dart'
    as _i46;
import 'package:mint_web/data/repository/firebase/firebase_specialist_repository.dart'
    as _i53;
import 'package:mint_web/domain/controller/booking_controller.dart' as _i19;
import 'package:mint_web/domain/controller/specialist_controller.dart' as _i51;
import 'package:mint_web/domain/entity/onboarding/onboarding.dart' as _i27;
import 'package:mint_web/domain/entity/onboarding_specialist/onboarding_specialist.dart'
    as _i26;
import 'package:mint_web/domain/entity/patient_book/patient_book.dart' as _i32;
import 'package:mint_web/domain/entity/specialist_profile_model/specialist_profile_model.dart'
    as _i29;
import 'package:mint_web/domain/service/abstract/audio_playback_service.dart'
    as _i13;
import 'package:mint_web/domain/service/abstract/audio_record_service.dart'
    as _i17;
import 'package:mint_web/domain/service/abstract/booking_service.dart' as _i71;
import 'package:mint_web/domain/service/abstract/phone_auth_service.dart'
    as _i47;
import 'package:mint_web/domain/service/abstract/specialist_service.dart'
    as _i54;
import 'package:mint_web/domain/service/audio_playback_service_impl.dart'
    as _i14;
import 'package:mint_web/domain/service/audio_record_service_impl.dart' as _i18;
import 'package:mint_web/domain/service/firebase/firebase_booking_service.dart'
    as _i72;
import 'package:mint_web/domain/service/firebase/firebase_phone_auth_service.dart'
    as _i48;
import 'package:mint_web/domain/service/firebase/firebase_specialist_service.dart'
    as _i55;
import 'package:mint_web/domain/usecase/add_new_specialist_use_case.dart'
    as _i66;
import 'package:mint_web/domain/usecase/add_work_info_data_use_case.dart'
    as _i67;
import 'package:mint_web/domain/usecase/dispose_player_use_case.dart' as _i23;
import 'package:mint_web/domain/usecase/dispose_recorder_use_case.dart' as _i24;
import 'package:mint_web/domain/usecase/fetch_patient_book_list_use_case.dart'
    as _i73;
import 'package:mint_web/domain/usecase/fetch_specialist_data_use_case.dart'
    as _i74;
import 'package:mint_web/domain/usecase/fetch_specializations_use_case.dart'
    as _i75;
import 'package:mint_web/domain/usecase/fetch_user_use_case.dart' as _i38;
import 'package:mint_web/domain/usecase/get_player_position_stream_use_case.dart'
    as _i39;
import 'package:mint_web/domain/usecase/get_player_state_stream_use_case.dart'
    as _i40;
import 'package:mint_web/domain/usecase/get_record_duration_stream_use_case.dart'
    as _i41;
import 'package:mint_web/domain/usecase/initialize_recorder_use_case.dart'
    as _i42;
import 'package:mint_web/domain/usecase/log_out_use_case.dart' as _i43;
import 'package:mint_web/domain/usecase/pause_player_use_case.dart' as _i44;
import 'package:mint_web/domain/usecase/resume_player_use_case.dart' as _i49;
import 'package:mint_web/domain/usecase/seek_player_use_case.dart' as _i50;
import 'package:mint_web/domain/usecase/start_player_use_case.dart' as _i57;
import 'package:mint_web/domain/usecase/start_recorder_use_case.dart' as _i58;
import 'package:mint_web/domain/usecase/stop_player_use_case.dart' as _i59;
import 'package:mint_web/domain/usecase/stop_recorder_use_case.dart' as _i60;
import 'package:mint_web/domain/usecase/update_specialist_profile_data_use_case.dart'
    as _i61;
import 'package:mint_web/domain/usecase/update_user_data_use_case.dart' as _i62;
import 'package:mint_web/domain/usecase/verify_otp_use_case.dart' as _i64;
import 'package:mint_web/domain/usecase/verify_phone_use_case.dart' as _i65;
import 'package:mint_web/presentation/bloc/app_notifications/app_notifications_bloc_web.dart'
    as _i4;
import 'package:mint_web/presentation/bloc/appointments/appointments_bloc.dart'
    as _i81;
import 'package:mint_web/presentation/bloc/audio_player/audio_player_bloc.dart'
    as _i68;
import 'package:mint_web/presentation/bloc/audio_record/audio_record_bloc.dart'
    as _i69;
import 'package:mint_web/presentation/bloc/auth/auth_bloc.dart' as _i70;
import 'package:mint_web/presentation/bloc/chat_presence/chat_presence_bloc.dart'
    as _i22;
import 'package:mint_web/presentation/bloc/onboarding/onboarding_bloc.dart'
    as _i76;
import 'package:mint_web/presentation/bloc/patients/patients_bloc.dart' as _i77;
import 'package:mint_web/presentation/bloc/specialist/specialist_bloc.dart'
    as _i78;
import 'package:mint_web/presentation/bloc/specialist_info/specialist_info_bloc.dart'
    as _i79;
import 'package:mint_web/presentation/bloc/specialist_profile/specialist_profile_bloc.dart'
    as _i80;
import 'package:mint_web/presentation/bloc/user/user_bloc.dart' as _i63;

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
    gh.factory<_i4.AppNotificationsBlocWeb>(() => _i4.AppNotificationsBlocWeb(
          gh<_i5.GetAppNotificationStreamUseCase>(),
          gh<_i6.FetchChatRoomUseCase>(),
          gh<_i7.MarkAppNotificationAsReadUseCase>(),
          gh<_i8.ClearAppNotificationsUseCase>(),
          gh<_i9.UserController<_i10.UserModel?>>(),
        ));
    gh.lazySingleton<_i11.AudioPlaybackRepository>(
        () => _i12.AudioPlaybackRepositoryImpl());
    gh.factory<_i13.AudioPlaybackService>(() =>
        _i14.AudioPlaybackServiceImpl(gh<_i11.AudioPlaybackRepository>()));
    gh.lazySingleton<_i15.AudioRecordRepository>(
        () => _i16.AudioRecordRepositoryImpl());
    gh.factory<_i17.AudioRecordService>(
        () => _i18.AudioRecordServiceImpl(gh<_i15.AudioRecordRepository>()));
    gh.lazySingleton<_i19.BookingController>(() => _i19.BookingController());
    gh.factory<_i20.BookingRepository>(
        () => _i21.FirebaseBookingRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i22.ChatPresenceBloc>(
        () => _i22.ChatPresenceBloc(gh<_i3.GetUserPresenceUseCase>()));
    gh.factory<_i23.DisposePlayerUseCase>(
        () => _i23.DisposePlayerUseCase(gh<_i13.AudioPlaybackService>()));
    gh.factory<_i24.DisposeRecorderUseCase>(
        () => _i24.DisposeRecorderUseCase(gh<_i17.AudioRecordService>()));
    gh.factory<_i25.Factory<_i26.OnboardingSpecialist?, _i27.Onboarding>>(
        () => _i28.OnboardingSpecialistFromOnboarding());
    gh.factory<_i25.Factory<_i29.SpecialistProfileModel, _i10.SpecialistModel>>(
        () => _i30.SpecialistProfileFromModel());
    gh.factory<_i25.Factory<_i10.SpecialistModel, _i26.OnboardingSpecialist>>(
        () => _i31.SpecialistModelFromOnboardingSpecialist());
    gh.factory<_i25.Factory<_i32.PatientBook, _i33.PatientBookDto>>(
        () => _i34.UserModelFromOnboardingSpecialist());
    gh.factory<_i25.Factory<_i10.UserModel, _i26.OnboardingSpecialist>>(
        () => _i35.UserModelFromOnboardingSpecialist());
    gh.factory<
        _i25.Factory<
            _i36.SpecialistProfileModelDto,
            _i29
            .SpecialistProfileModel>>(() => _i37.SpecialistProfileModelToDto());
    gh.factory<_i38.FetchUserUseCase>(
        () => _i38.FetchUserUseCase(gh<_i3.UserService>()));
    gh.factory<_i39.GetPlayerPositionStreamUseCase>(() =>
        _i39.GetPlayerPositionStreamUseCase(gh<_i13.AudioPlaybackService>()));
    gh.factory<_i40.GetPlayerStateStreamUseCase>(() =>
        _i40.GetPlayerStateStreamUseCase(gh<_i13.AudioPlaybackService>()));
    gh.factory<_i41.GetRecordDurationStreamUseCase>(() =>
        _i41.GetRecordDurationStreamUseCase(gh<_i17.AudioRecordService>()));
    gh.factory<_i42.InitializeRecorderUseCase>(
        () => _i42.InitializeRecorderUseCase(gh<_i17.AudioRecordService>()));
    gh.factory<_i43.LogOutUseCase>(
        () => _i43.LogOutUseCase(gh<_i3.UserService>()));
    gh.factory<_i44.PausePlayerUseCase>(
        () => _i44.PausePlayerUseCase(gh<_i13.AudioPlaybackService>()));
    gh.lazySingleton<_i45.PhoneAuthRepository>(
        () => _i46.FirebasePhoneAuthRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i47.PhoneAuthService>(
        () => _i48.FirebasePhoneAuthService(gh<_i45.PhoneAuthRepository>()));
    gh.factory<_i49.ResumePlayerUseCase>(
        () => _i49.ResumePlayerUseCase(gh<_i13.AudioPlaybackService>()));
    gh.factory<_i50.SeekPlayerUseCase>(
        () => _i50.SeekPlayerUseCase(gh<_i13.AudioPlaybackService>()));
    gh.lazySingleton<_i51.SpecialistController>(
        () => _i51.SpecialistController());
    gh.factory<_i52.SpecialistRepository>(
        () => _i53.FirebaseSpecialistRepository(gh<_i3.FirebaseInitializer>()));
    gh.factory<_i54.SpecialistService>(() => _i55.FirebaseSpecialistService(
          gh<_i52.SpecialistRepository>(),
          gh<_i3.UserService>(),
          gh<
              _i25.Factory<_i56.Future<_i10.SpecialistModel>,
                  _i10.SpecialistModelDto>>(),
          gh<_i25.Factory<_i10.SpecialistModelDto, _i10.SpecialistModel>>(),
          gh<_i25.Factory<_i29.SpecialistProfileModel, _i10.SpecialistModel>>(),
          gh<
              _i25.Factory<_i36.SpecialistProfileModelDto,
                  _i29.SpecialistProfileModel>>(),
        ));
    gh.factory<_i57.StartPlayerUseCase>(
        () => _i57.StartPlayerUseCase(gh<_i13.AudioPlaybackService>()));
    gh.factory<_i58.StartRecorderUseCase>(
        () => _i58.StartRecorderUseCase(gh<_i17.AudioRecordService>()));
    gh.factory<_i59.StopPlayerUseCase>(
        () => _i59.StopPlayerUseCase(gh<_i13.AudioPlaybackService>()));
    gh.factory<_i60.StopRecorderUseCase>(
        () => _i60.StopRecorderUseCase(gh<_i17.AudioRecordService>()));
    gh.factory<_i61.UpdateSpecialistProfileDataUseCase>(() =>
        _i61.UpdateSpecialistProfileDataUseCase(gh<_i54.SpecialistService>()));
    gh.factory<_i62.UpdateUserDataUseCase>(
        () => _i62.UpdateUserDataUseCase(gh<_i3.UserService>()));
    gh.factory<_i63.UserBloc>(() => _i63.UserBloc(
          gh<_i9.UserController<_i10.UserModel?>>(),
          gh<_i38.FetchUserUseCase>(),
          gh<_i43.LogOutUseCase>(),
          gh<_i3.InitializeUserPresenceUseCase>(),
        ));
    gh.factory<_i64.VerifyOtpUseCase>(
        () => _i64.VerifyOtpUseCase(gh<_i47.PhoneAuthService>()));
    gh.factory<_i65.VerifyPhoneUseCase>(
        () => _i65.VerifyPhoneUseCase(gh<_i47.PhoneAuthService>()));
    gh.factory<_i66.AddSpecialistWithIdUseCase>(
        () => _i66.AddSpecialistWithIdUseCase(gh<_i54.SpecialistService>()));
    gh.factory<_i67.AddWorkInfoDataUseCase>(
        () => _i67.AddWorkInfoDataUseCase(gh<_i54.SpecialistService>()));
    gh.factory<_i68.AudioPlayerBloc>(() => _i68.AudioPlayerBloc(
          gh<_i57.StartPlayerUseCase>(),
          gh<_i49.ResumePlayerUseCase>(),
          gh<_i39.GetPlayerPositionStreamUseCase>(),
          gh<_i40.GetPlayerStateStreamUseCase>(),
          gh<_i50.SeekPlayerUseCase>(),
          gh<_i44.PausePlayerUseCase>(),
          gh<_i59.StopPlayerUseCase>(),
          gh<_i23.DisposePlayerUseCase>(),
        ));
    gh.factory<_i69.AudioRecordBloc>(() => _i69.AudioRecordBloc(
          gh<_i42.InitializeRecorderUseCase>(),
          gh<_i58.StartRecorderUseCase>(),
          gh<_i41.GetRecordDurationStreamUseCase>(),
          gh<_i60.StopRecorderUseCase>(),
          gh<_i24.DisposeRecorderUseCase>(),
        ));
    gh.factory<_i70.AuthBloc>(() => _i70.AuthBloc(
          gh<_i65.VerifyPhoneUseCase>(),
          gh<_i64.VerifyOtpUseCase>(),
        ));
    gh.factory<_i71.BookingService>(() => _i72.FirebaseBookingService(
          gh<_i20.BookingRepository>(),
          gh<_i25.Factory<_i32.PatientBook, _i33.PatientBookDto>>(),
        ));
    gh.factory<_i73.FetchPatientBookListUseCase>(
        () => _i73.FetchPatientBookListUseCase(gh<_i71.BookingService>()));
    gh.factory<_i74.FetchSpecialistDataUseCase>(
        () => _i74.FetchSpecialistDataUseCase(gh<_i54.SpecialistService>()));
    gh.factory<_i75.FetchSpecializationsUseCase>(
        () => _i75.FetchSpecializationsUseCase(gh<_i54.SpecialistService>()));
    gh.factory<_i76.OnboardingBloc>(
        () => _i76.OnboardingBloc(gh<_i75.FetchSpecializationsUseCase>()));
    gh.factory<_i77.PatientsBloc>(() => _i77.PatientsBloc(
          gh<_i73.FetchPatientBookListUseCase>(),
          gh<_i9.UserController<_i10.UserModel?>>(),
          gh<_i19.BookingController>(),
        ));
    gh.factory<_i78.SpecialistBloc>(() => _i78.SpecialistBloc(
          gh<_i66.AddSpecialistWithIdUseCase>(),
          gh<_i62.UpdateUserDataUseCase>(),
          gh<_i67.AddWorkInfoDataUseCase>(),
          gh<_i25.Factory<_i26.OnboardingSpecialist?, _i27.Onboarding>>(),
          gh<_i25.Factory<_i10.SpecialistModel, _i26.OnboardingSpecialist>>(),
          gh<_i25.Factory<_i10.UserModel, _i26.OnboardingSpecialist>>(),
          gh<_i9.UserController<_i10.UserModel?>>(),
          gh<_i51.SpecialistController>(),
        ));
    gh.factory<_i79.SpecialistInfoBloc>(() => _i79.SpecialistInfoBloc(
          gh<_i74.FetchSpecialistDataUseCase>(),
          gh<_i51.SpecialistController>(),
          gh<_i9.UserController<_i10.UserModel?>>(),
        ));
    gh.factory<_i80.SpecialistProfileBloc>(() => _i80.SpecialistProfileBloc(
          gh<_i75.FetchSpecializationsUseCase>(),
          gh<_i61.UpdateSpecialistProfileDataUseCase>(),
          gh<_i51.SpecialistController>(),
          gh<_i9.UserController<_i10.UserModel?>>(),
        ));
    gh.factory<_i81.AppointmentsBloc>(() => _i81.AppointmentsBloc(
          gh<_i73.FetchPatientBookListUseCase>(),
          gh<_i9.UserController<_i10.UserModel?>>(),
          gh<_i19.BookingController>(),
          gh<_i3.GetExcludedDaysByIdUseCase>(),
        ));
    return this;
  }
}
