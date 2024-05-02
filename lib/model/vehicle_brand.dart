import 'package:get/get.dart';

class VehicleModel {
    RxList<BrandListModel> data;

    VehicleModel({
        required this.data,
    });

    factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        data: RxList<BrandListModel>.from(json["vehicles"].map((x) => BrandListModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vehicles": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}
class BrandListModel {
  int id;
  String brandName;
  String brandImage;

  BrandListModel({
    required this.id,
    required this.brandName,
    required this.brandImage,
  });

  factory BrandListModel.fromJson(Map<String, dynamic> json) {
    return BrandListModel(
        id: json["_id"],
        brandName: json["brandName"],
        brandImage: json["brandImage"]);
  }

     Map<String, dynamic> toJson() => {
        "brandName": brandName,
        "brandImage": brandImage,
       "_id":id
    };
}
