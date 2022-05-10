class User {
  final String name;
  final String email;
  final String photo;
  final String role;

  User(
      {required this.name,
      required this.role,
      required this.email,
      required this.photo});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'] as String,
        role: json['role'] as String,
        email: json['email'] as String,
        photo: json['profilePicture'] ?? '');
  }
}
