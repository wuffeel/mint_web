part of 'specialist_profile_bloc.dart';

@immutable
abstract class SpecialistProfileEvent {}

class SpecialistProfileEditRequested extends SpecialistProfileEvent {}

class SpecialistProfileEditCancelRequested extends SpecialistProfileEvent {}

class SpecialistProfileUpdateRequested extends SpecialistProfileEvent {}

class SpecialistProfileEditInfoChanged extends SpecialistProfileEvent {
  SpecialistProfileEditInfoChanged({
    this.specialist,
    this.user,
    this.photoData,
  });

  final SpecialistModel? specialist;
  final UserModel? user;
  final FileData? photoData;
}
