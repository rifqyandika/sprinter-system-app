class Sprinter {
  // ignore: non_constant_identifier_names
  final String seller_name;
  // ignore: non_constant_identifier_names
  final String created_at;
  final int package;

  Sprinter({
    // ignore: non_constant_identifier_names
    required this.seller_name,
    // ignore: non_constant_identifier_names
    required this.created_at,
    required this.package,
  });

  factory Sprinter.fromJson(Map<String, dynamic> json) {
    return Sprinter(
      seller_name: json['seller_name'],
      created_at: json['created_at'],
      package: json['package'],
    );
  }
}
