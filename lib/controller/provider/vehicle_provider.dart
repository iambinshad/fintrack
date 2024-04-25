import 'dart:developer';

import 'package:fintrack/controller/services/vehicle_adding.dart';
import 'package:fintrack/model/vehicle.dart';
import 'package:get/get.dart';

class VehicleController extends GetxController {
  RxList vehicleList = [].obs;

  Future<void> fetchAllVehicle() async {
    VehicleService vehicleService = VehicleService();
    vehicleList = await vehicleService.getAllVehicle(Get.context);
    update();
    log(vehicleList.toString());
  }
}
