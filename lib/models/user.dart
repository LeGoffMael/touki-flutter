class User {
  int id;
  String userName;
  String firstName;
  String lastName;
  String profileImagePath;

  User({
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.profileImagePath,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      userName: json['userName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profileImagePath: json['profileImagePath'] as String,
    );
  }
}
