import 'dart:developer';

import 'package:fintrack/controller/provider/vehicle_provider.dart';
import 'package:fintrack/feature/home/screens/vehicle_adding_screen.dart';
import 'package:fintrack/feature/home/screens/vehicle_details_page.dart';
import 'package:fintrack/feature/home/screens/vehicle_search.dart';
import 'package:fintrack/feature/home/widgets/vehicle_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/HomePage";
  HomePage({super.key});

  final vehicleProvider = Get.put(VehicleController());

  @override
  Widget build(BuildContext context) {
    final vehicleProvider = Get.put(VehicleController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(VehicleSearchingScreen());
            },
            icon: Icon(Icons.search)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, VehicleAddingScreen.routeName);
          log(DateTime.now().toString());
          //          DateTime now =
          // String formattedDateTime = now.toIso8601String().split('.')[0]; // Remove milliseconds part
          // print('Formatted date and time: $formattedDateTime');
        },
        child: const Icon(Icons.car_crash),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "My Cars",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GetBuilder<VehicleController>(
                initState: (state) {
                  vehicleProvider.fetchAllVehicle();
                  Get.put(VehicleController());
                },
                builder: (controller) {
                  final cntrl = Get.find<VehicleController>();
                  if (cntrl.vehicleList.isNotEmpty) {
                    return ListView.builder(
                      // reverse:true ,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cntrl.vehicleList.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              Get.to(VehicleDetailsPage(
                                carListItem: CarListItem(
                                  index: index,
                                  image: cntrl.vehicleList[index].images,
                                  price: cntrl.vehicleList[index].price,
                                  name: cntrl.vehicleList[index].name,
                                  descri: cntrl.vehicleList[index].description,
                                ),
                              ));
                            },
                            child: CarListItem(
                              index: index,
                              image: cntrl.vehicleList[index].images,
                              price: cntrl.vehicleList[index].price,
                              name: cntrl.vehicleList[index].name,
                              descri: cntrl.vehicleList[index].description,
                            )),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("NO Vehicle Available"),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
