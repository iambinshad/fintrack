import 'dart:developer';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fintrack/common/widgets/custom_button.dart';
import 'package:fintrack/common/widgets/custome_textfield.dart';
import 'package:fintrack/constants/global_varialbles.dart';
import 'package:fintrack/constants/utils.dart';
import 'package:fintrack/controller/services/vehicle_adding.dart';
import 'package:fintrack/core/constant.dart';
import 'package:fintrack/model/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VehicleAddingScreen extends StatefulWidget {
  static const String routeName = "/vehicleAddingScreen";
  VehicleAddingScreen({super.key});

  @override
  State<VehicleAddingScreen> createState() => _VehicleAddingScreenState();
}

class _VehicleAddingScreenState extends State<VehicleAddingScreen> {
  TextEditingController vehicleNameCntrl = TextEditingController();
  TextEditingController vehicleBrandCntrl = TextEditingController();

  TextEditingController vehicleDescCntrl = TextEditingController();
  TextEditingController vehiclepriceCntrl = TextEditingController();

  VehicleService vehicleService = VehicleService();
  File? _imgFile;
  void takeSnapshot() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickMedia(
      // source: ImageSource.camera, // alternatively, use ImageSource.gallery
      maxWidth: 400,
    );
    if (img == null) return;
    setState(() {
      _imgFile = File(img.path); // convert it to a Dart:io file
    });
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
                        takeSnapshot();
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
              CustomTextField(
                controller: vehicleBrandCntrl,
                hintText: "Brand",
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
