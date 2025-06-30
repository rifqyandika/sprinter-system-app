class Sprinter {
  final String sellerName;
  final String createdAt;
  final int packageNumber;
  final String sprinterName;
  final String code;

  Sprinter({
    required this.sellerName,
    required this.createdAt,
    required this.packageNumber,
    required this.sprinterName,
    required this.code,
  });

  factory Sprinter.fromJson(Map<String, dynamic> json) {
    return Sprinter(
      sellerName: json['sellerName'],
      createdAt: json['createdAt'],
      packageNumber: json['packageNumber'],
      sprinterName: json['user']['name'],
      code: json['user']['code'],
    );
  }
}
