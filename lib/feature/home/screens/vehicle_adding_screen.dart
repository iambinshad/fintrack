import 'dart:developer';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fintrack/common/widgets/custom_button.dart';
import 'package:fintrack/common/widgets/custome_textfield.dart';
import 'package:fintrack/constants/global_varialbles.dart';
import 'package:fintrack/constants/utils.dart';
import 'package:fintrack/controller/provider/brand_provider.dart';
import 'package:fintrack/controller/services/vehicle_adding.dart';
import 'package:fintrack/core/constant.dart';
import 'package:fintrack/model/vehicle.dart';
import 'package:fintrack/model/vehicle_brand.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VehicleAddingScreen extends StatefulWidget {
  static const String routeName = "/vehicleAddingScreen";
  VehicleAddingScreen({super.key});

  @override
  State<VehicleAddingScreen> createState() => _VehicleAddingScreenState();
}

class _VehicleAddingScreenState extends State<VehicleAddingScreen> {
  final brandProvider = Get.put(BrandController());
  var brandList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      brandList = await brandProvider.fetchBrandListCntrl();
      brandList.add(
          BrandModel(id: "0", brandName: "Add New Brand   +", brandImage: ""));
      log(brandList.toString());
      brandProvider.update();
    });
    super.initState();
  }

  TextEditingController vehicleNameCntrl = TextEditingController();
  TextEditingController vehicleBrandCntrl = TextEditingController();
  TextEditingController addNewBrandContrl = TextEditingController();

  TextEditingController vehicleDescCntrl = TextEditingController();
  TextEditingController vehiclepriceCntrl = TextEditingController();

  VehicleService vehicleService = VehicleService();
  File? _imgFile;
  File? _brandImageFile;
  void takeSnapshot(from) async {
    final ImagePicker picker = ImagePicker();
    if (from == "image") {
      final XFile? img = await picker.pickMedia(
        // source: ImageSource.camera, // alternatively, use ImageSource.gallery
        maxWidth: 400,
      );
      if (img == null) return;
      setState(() {
        _imgFile = File(img.path); // convert it to a Dart:io file
      });
    } else {
      final XFile? img = await picker.pickMedia(
        // source: ImageSource.camera, // alternatively, use ImageSource.gallery
        maxWidth: 400,
      );
      if (img == null) return;
      setState(() {
        _brandImageFile = File(img.path); // convert it to a Dart:io file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Vehicle Image", style: appBarTitleStyle),
              _imgFile == null
                  ? InkWell(
                      onTap: () {
                        takeSnapshot("image");
                      },
                      child: DottedBorder(
                        dashPattern: const [5, 5, 5, 5],
                        strokeWidth: 1.5,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(6),
                        child: SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                    )
                  : Image(image: FileImage(_imgFile!)),
              kHeight10,
              CustomTextField(
                controller: vehicleNameCntrl,
                hintText: "Vehicle Name",
              ),
              kHeight10,
              Obx(
                () => SizedBox(
                  height: 60,
                  child: CustomTextField(
                    suffix: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<BrandModel>(
                        isExpanded: true,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        iconEnabledColor: Colors.red,
                        icon: const Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: Icon(Icons.arrow_forward_ios_rounded,
                              color: Colors.black26, size: 20),
                        ),
                        isDense: true,
                        value: brandProvider.selectedBrand.value,
                        items: brandList
                            .map((brand) => DropdownMenuItem<BrandModel>(
                                  value: brand,
                                  child: Text(brand.brandName),
                                ))
                            .toList(),
                        onChanged: (brand) {
                          if (brand!.id != "0") {
                            brandProvider.onBrandSelected(brand);
                            vehicleBrandCntrl.text = brand.brandName;
                          } else {
                            showModalBottomSheet<void>(
                                // context and builder are
                                // required properties in this widget
                                context: context,
                                builder: (BuildContext context) {
                                  // we set up a container inside which
                                  // we create center column and display text

                                  // Returning SizedBox instead of a Container
                                  return SizedBox(
                                    height: 200,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              height: 60,
                                              child: CustomTextField(
                                                
                                                  controller: addNewBrandContrl,
                                                  hintText: "Type New Brand Name"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CustomButton(
                                                childText: "Add New Brand",
                                                onTap: () {
                                                  brandProvider.addNewBrandCntrl(addNewBrandContrl.text, _brandImageFile!.path);
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                        },
                      ),
                    ),
                    controller: vehicleBrandCntrl,
                    hintText: "Brand",
                  ),
                ),
              ),
              kHeight10,
              CustomTextField(
                controller: vehicleDescCntrl,
                hintText: "Descrption",
              ),
              kHeight10,
              CustomTextField(
                controller: vehiclepriceCntrl,
                hintText: "Price",
              ),
              kHeight10,
              CustomButton(
                onTap: () {
                  addButtonClicked();
                },
                childText: "Add Vehicle",
              )
            ],
          ),
        ),
      ),
    );
  }

  void addButtonClicked() async {
    dynamic url;
    // final prov = Provider.of<UserProfileProvider>(context, listen: false);
    if (_imgFile != null) {
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(_imgFile!.path,
              resourceType: CloudinaryResourceType.Image));
      url = response.secureUrl;
    } else {
      showSnackBar(context, "Image is required");
      return;
    }
    if (url == null) {
      showSnackBar(context, "Something went wrong!");
      return;
    }
    VehicleService vehicleService = VehicleService();
    log(url);
    Vehicle vehicle = Vehicle(
        name: vehicleNameCntrl.text,
        images: url,
        brand: vehicleBrandCntrl.text,
        description: vehicleDescCntrl.text,
        price: vehiclepriceCntrl.text);
    await vehicleService.addVehicle(vehicle, context);
    Navigator.pop(context);
  }
}
