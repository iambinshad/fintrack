class BrandModel {
  final String id;
  final String brandName;
  final String brandImage;

  BrandModel({required this.id, required this.brandName, required this.brandImage});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'],
      brandName: json['brandName'],
      brandImage: json['brandImage'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BrandModel &&
        other.id == id &&
        other.brandName == brandName &&
        other.brandImage == brandImage;
  }

  @override
  int get hashCode => id.hashCode ^ brandName.hashCode ^ brandImage.hashCode;
}
