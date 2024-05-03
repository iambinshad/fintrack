import 'dart:convert';
import 'dart:developer';

import 'package:fintrack/constants/global_varialbles.dart';
import 'package:fintrack/controller/provider/brand_provider.dart';
import 'package:fintrack/model/vehicle_brand.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Brand {
  Future<List<BrandModel>> fetchBrandList() async {
    final BrandController pro = Get.find();

    try {
      final response = await http.get(
        Uri.parse(url + "api/brandList"),
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var brandList = jsonResponse['brandList'] as List<dynamic>;
        return brandList.map((item) => BrandModel.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<bool> addNewBrand(brandName, brandImage) async {
    final BrandController pro = Get.find();

    try {
      final response = await http.post(Uri.parse(url + "api/addBrand"),
          body: {"brandName": brandName, "brandImage": brandImage});
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
