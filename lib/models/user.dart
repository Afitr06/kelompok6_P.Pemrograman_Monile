class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String profilePhoto;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.profilePhoto,
    this.phoneNumber,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      name: map["name"],
      username: map["username"],
      email: map["email"],
      profilePhoto: map["profile_photo"],
      phoneNumber: map["phone_number"],
    );
  }

  factory User.dummy() {
    return User(
      id: 001,
      name: "kelompok  ",
      username: "enam",
      email: "enam@itg.ac.id",
      profilePhoto:
          "data:image/jpeg;base64,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",
      phoneNumber: "",
    );
  }
}
