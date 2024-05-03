import 'dart:convert';
import 'dart:developer';

import 'package:fintrack/constants/error_handling.dart';
import 'package:fintrack/constants/global_varialbles.dart';
import 'package:fintrack/constants/utils.dart';
import 'package:fintrack/controller/provider/vehicle_provider.dart';
import 'package:fintrack/model/vehicle.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VehicleService {
  Future<void> addVehicle(Vehicle vehicle, context) async {
    final data = jsonEncode({
      "name": "${vehicle.name}",
      "price": "${vehicle.price}",
      "description": "${vehicle.description}",
      "images": vehicle.images,
      "brand": "${vehicle.brand}"
    });
    try {
      log(vehicle.name);
      http.Response res = await http.post(Uri.parse("${url}api/addVehicle"),
          body: data,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      log(res.body.toString());
      httpErrorHandle(
          res: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, "New Vehicle Added Succusfully!");
            await Get.find<VehicleController>().fetchAllVehicle();

          });
    } catch (e) {
      log(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  Future<RxList<Vehicle>> getAllVehicle(context) async {
    try {
      http.Response res = await http
          .get(Uri.parse("${url}api/getVehicle"), headers: <String, String>{
        'x-auth-token':
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MGM0M2U1OGQ4NmMwZWRmOTI1NTIyOSIsImlhdCI6MTcxNDAzMzQ1MX0.eac7lk__FutMHerech7cSOGcKRPg3R5scGAQiadch2k",
        'Content-Type': 'application/json; charset=UTF-8',
      });
      log(res.body.toString());
      VehicleModel allVehicleListConverted =
          VehicleModel.fromJson(json.decode(res.body));
      httpErrorHandle(
          res: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, "Vehicle Fetching Successfull!");
          });

      return allVehicleListConverted.data;
    } catch (e) {
      log(e.toString());
      showSnackBar(context, e.toString());
      RxList<Vehicle> list = RxList([]);
      return list;
    }
  }
}
