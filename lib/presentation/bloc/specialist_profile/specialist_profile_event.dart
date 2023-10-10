part of 'specialist_profile_bloc.dart';

@immutable
abstract class SpecialistProfileEvent {}

class SpecialistProfileEditRequested extends SpecialistProfileEvent {}

class SpecialistProfileEditCancelRequested extends SpecialistProfileEvent {}

class SpecialistProfilePickImageRequested extends SpecialistProfileEvent {}

class SpecialistProfileUpdateRequested extends SpecialistProfileEvent {}

class SpecialistProfileEditInfoChanged extends SpecialistProfileEvent {
  SpecialistProfileEditInfoChanged({
    this.specialist,
    this.user,
    this.photoData,
    this.currentSpecializations,
  });

  final SpecialistModel? specialist;
  final UserModel? user;
  final FileData? photoData;
  final List<String?>? currentSpecializations;
}
