class ExperienceModel {
  ExperienceModel({
    this.experience,
    this.noExperience = false,
    this.about,
    this.education,
  });

  final DateTime? experience;
  final bool noExperience;
  final String? about;
  final String? education;

  ExperienceModel copyWith({
    DateTime? experience,
    bool? noExperience,
    String? about,
    String? education,
  }) {
    return ExperienceModel(
      experience: experience ?? this.experience,
      noExperience: noExperience ?? this.noExperience,
      about: about ?? this.about,
      education: education ?? this.education,
    );
  }
}
