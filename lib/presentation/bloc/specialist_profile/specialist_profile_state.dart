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
    this.user,
    this.currentSpecializations, {
    required super.availableSpecializations,
    this.photoData,
  });

  final SpecialistModel specialist;
  final UserModel user;
  final List<String?> currentSpecializations;
  final FileData? photoData;

  SpecialistProfileEditState copyWith({
    SpecialistModel? specialist,
    UserModel? user,
    List<String?>? currentSpecializations,
    List<String>? availableSpecializations,
    FileData? photoData,
  }) {
    return SpecialistProfileEditState(
      specialist ?? this.specialist,
      user ?? this.user,
      currentSpecializations ?? this.currentSpecializations,
      availableSpecializations:
          availableSpecializations ?? this.availableSpecializations,
      photoData: photoData ?? this.photoData,
    );
  }
}

class SpecialistProfileSpecializationsLoading
    extends SpecialistProfileEditState {
  const SpecialistProfileSpecializationsLoading(
    super.specialist,
    super.user,
    super.currentSpecializations, {
    super.availableSpecializations,
  });
}

class SpecialistProfileUpdateLoading extends SpecialistProfileEditState {
  const SpecialistProfileUpdateLoading(
    super.specialist,
    super.user,
    super.currentSpecializations, {
    required super.availableSpecializations,
    required super.photoData,
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
