class Sprinter {
  // ignore: non_constant_identifier_names
  final String sellerName;
  // ignore: non_constant_identifier_names
  final String createdAt;
  final int package;

  Sprinter({
    // ignore: non_constant_identifier_names
    required this.sellerName,
    // ignore: non_constant_identifier_names
    required this.createdAt,
    required this.package,
  });

  factory Sprinter.fromJson(Map<String, dynamic> json) {
    return Sprinter(
      sellerName: json['sellerName'],
      createdAt: json['createdAt'],
      package: json['package'],
    );
  }
}
