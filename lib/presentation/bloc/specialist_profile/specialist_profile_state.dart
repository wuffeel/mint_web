part of 'specialist_profile_bloc.dart';

@immutable
abstract class SpecialistProfileState {
  const SpecialistProfileState({this.availableSpecializations});

  final List<String>? availableSpecializations;
}

class SpecialistProfileInitial extends SpecialistProfileState {
  const SpecialistProfileInitial({super.availableSpecializations});
}

class SpecialistProfileSpecializationsFetchFailure
    extends SpecialistProfileState {}

class SpecialistProfileEditState extends SpecialistProfileState {
  const SpecialistProfileEditState(
    this.specialist,
    this.user, {
    required super.availableSpecializations,
    this.photoData,
  });

  final SpecialistModel specialist;
  final UserModel user;
  final FileData? photoData;
}

class SpecialistProfileSpecializationsLoading
    extends SpecialistProfileEditState {
  const SpecialistProfileSpecializationsLoading(
    super.specialist,
    super.user, {
    super.availableSpecializations,
  });
}

class SpecialistProfileUpdateSuccess extends SpecialistProfileState {
  const SpecialistProfileUpdateSuccess({
    required super.availableSpecializations,
  });
}

class SpecialistProfileUpdateFailure extends SpecialistProfileState {
  const SpecialistProfileUpdateFailure({
    required super.availableSpecializations,
  });
}
