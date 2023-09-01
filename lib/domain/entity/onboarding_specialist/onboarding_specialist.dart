class OnboardingSpecialist {
  OnboardingSpecialist({
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.price,
    this.experience,
    this.specializations,
    this.about,
    this.education,
    this.workInfo,
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
