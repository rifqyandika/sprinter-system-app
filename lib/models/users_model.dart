class UsersModel {
  final String name;
  final String email;
  final String nik;
  final String code;
  final String roles;

  UsersModel({
    required this.name,
    required this.email,
    required this.nik,
    required this.roles,
    required this.code,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      name: json['name'],
      email: json['email'],
      nik: json['nik'],
      roles: json['roles'],
      code: json['code'], // Handle case where 'code' might not be present
    );
  }
}
