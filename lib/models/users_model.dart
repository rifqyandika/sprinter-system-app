class User {
  final String email;
  final String nik;
  final String code;
  final String name;
  final List<String> roles;

  User({
    required this.email,
    required this.nik,
    required this.code,
    required this.name,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      nik: json['nik'],
      code: json['code'],
      name: json['name'],
      roles: List<String>.from(json['roles']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'nik': nik,
      'code': code,
      'name': name,
      'roles': roles,
    };
  }
}
