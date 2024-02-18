class User {
  String name;
  String email;
  String password;
  String? latitude;
  String? longitude;

  User({
    required this.name,
    required this.email,
    required this.password,
    this.latitude,
    this.longitude,
  });
}
