import 'package:fintrack/controller/services/brand_list.dart';
import 'package:fintrack/model/vehicle_brand.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  final selectedBrand = Rx<BrandModel?>(null);
  Brand brand = Brand();

  Future fetchBrandListCntrl() async {
    // log("Before");
    final brands = await brand.fetchBrandList();
    return brands;
  }

  Future addNewBrandCntrl(brandName, brandImage) async {
    return brand.addNewBrand(brandName, brandImage);
  }

  void onBrandSelected(BrandModel? brand) {
    selectedBrand.value = brand;
    update();
    // Update UI based on selected brand (optional)
  }
}
