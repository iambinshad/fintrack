import 'package:fintrack/controller/services/brand_list.dart';
import 'package:fintrack/model/vehicle_brand.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  RxList brandList = [].obs;

  Future<void> fetchBrandListCntrl() async {
    Brand brand = Brand();
    brandList = await brand.fetchBrandList();
  }
}
