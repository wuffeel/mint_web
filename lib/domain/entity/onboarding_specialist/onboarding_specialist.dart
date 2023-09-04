class OnboardingSpecialist {
  OnboardingSpecialist({
    required this.dateOfBirth,
    required this.email,
    required this.experience,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.price,
    required this.specializations,
    required this.workInfo,
    this.about,
    this.education,
    this.photoUrl,
  });

  final DateTime dateOfBirth;
  final String email;
  final DateTime experience;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int price;
  final List<String> specializations;
  final Map<String, Map<String, String>> workInfo;
  final String? about;
  final String? education;
  final String? photoUrl;

  OnboardingSpecialist copyWith({
    DateTime? dateOfBirth,
    String? email,
    DateTime? experience,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    int? price,
    List<String>? specializations,
    Map<String, Map<String, String>>? workInfo,
    String? about,
    String? education,
    String? photoUrl,
  }) {
    return OnboardingSpecialist(
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      experience: experience ?? this.experience,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      price: price ?? this.price,
      specializations: specializations ?? this.specializations,
      workInfo: workInfo ?? this.workInfo,
      about: about ?? this.about,
      education: education ?? this.education,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
