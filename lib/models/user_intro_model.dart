class UserIntro {
  final String fullName;
  final String profession;
  final String bioDesc;
  final String github;
  final String linkedIn;
  final String slack;
  UserIntro({
    required this.fullName,
    required this.profession,
    required this.bioDesc,
    required this.github,
    required this.linkedIn,
    required this.slack,
  });

  UserIntro copyWith({
    String? fullName,
    String? profession,
    String? bioDesc,
    String? github,
    String? linkedIn,
    String? slack,
  }) {
    return UserIntro(
        fullName: fullName ?? this.fullName,
        profession: profession ?? this.profession,
        bioDesc: bioDesc ?? this.bioDesc,
        github: github ?? this.github,
        linkedIn: linkedIn ?? this.linkedIn,
        slack: slack ?? this.slack);
  }
}
