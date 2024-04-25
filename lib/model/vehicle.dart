
import 'package:get/get.dart';

class VehicleModel {
    RxList<Vehicle> data;

    VehicleModel({
        required this.data,
    });

    factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        data: RxList<Vehicle>.from(json["vehicles"].map((x) => Vehicle.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vehicles": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Vehicle {
    String name;
    String images;
    String brand;
    String description;
    String price;

    Vehicle({
        required this.name,
        required this.images,
        required this.brand,
        required this.description,
        required this.price,
    });

    factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
        name: json["name"],
        images: json["images"],
        brand: json["brand"],
        description: json["description"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "images": images,
        "brand": brand,
        "description": description,
        "price": price,
    };
}
