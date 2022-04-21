class User {
  final String name;
  final String username;
  final String? password;
  final String email;
  final String? photo;

  User(
      {required this.name,
      required this.username,
      this.password,
      required this.email,
      this.photo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        password: json['password'] ?? '' as String,
        photo: json['profilePicture'] ?? '' as String);
  }
}
