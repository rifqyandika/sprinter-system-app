class Sprinter {
  final String sellerName;
  final String createdAt;
  final int package;
  final String sprinterName;
  final String code;

  Sprinter({
    required this.sellerName,
    required this.createdAt,
    required this.package,
    required this.sprinterName,
    required this.code,
  });

  factory Sprinter.fromJson(Map<String, dynamic> json) {
    return Sprinter(
      sellerName: json['sellerName'],
      createdAt: json['createdAt'],
      package: json['package'],
      sprinterName: json['sprinter']['name'],
      code: json['sprinter']['code'],
    );
  }
}
