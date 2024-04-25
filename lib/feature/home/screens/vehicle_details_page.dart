// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fintrack/constants/global_varialbles.dart';
import 'package:fintrack/feature/home/widgets/vehicle_list_item.dart';

class VehicleDetailsPage extends StatelessWidget {
  static const String routeName = "/vehDetailsPage";
  CarListItem? carListItem;
  VehicleDetailsPage({
    Key? key,
     this.carListItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMW",
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CarListItem(
            index: carListItem?.index,
            image: carListItem?.image,
            price: carListItem?.price,
            name: carListItem?.name,
            descri: carListItem?.descri,
          ),
        ],
      ),
    );
  }
}
