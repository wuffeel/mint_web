class OnboardingSpecialistDto {
  OnboardingSpecialistDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
    required this.price,
    required this.experience,
    required this.specializations,
    required this.about,
    required this.education,
    required this.workInfo,
    this.photoUrl,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime? dateOfBirth;
  final int? price;
  final DateTime? experience;
  final List<String>? specializations;
  final String? about;
  final String? education;
  final Map<String, Map<String, String>>? workInfo;
  final String? photoUrl;
}
