import 'dart:convert';
import 'dart:developer';

import 'package:fintrack/constants/global_varialbles.dart';
import 'package:fintrack/model/vehicle_brand.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Brand {
  Future<RxList<BrandListModel>> fetchBrandList() async {
    try {
      final response = await http.get(
        Uri.parse(url + "/api/brandList"),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> brandResponseMap = json.decode(response.body);
        List<dynamic> brandData = brandResponseMap['brandList'];
        // setState(() {
        return brandData.map((item) => BrandListModel.fromJson(item)).toList();
        // });
      } else {
        return  RxList<BrandListModel> list = RxList([]);
      }
    } catch (e) {
      log(e.toString());
      return       RxList<BrandListModel> list = RxList([]);

    }
  }
}
