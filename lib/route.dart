import 'package:fintrack/common/widgets/bottom_nav.dart';
import 'package:fintrack/feature/home/screens/homepage.dart';
import 'package:fintrack/feature/home/screens/vehicle_adding_screen.dart';
import 'package:fintrack/feature/home/screens/vehicle_details_page.dart';
import 'package:fintrack/feature/home/screens/vehicle_search.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => HomePage());
    case VehicleDetailsPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => VehicleDetailsPage());
    case BottomNavScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BottomNavScreen());
    case VehicleAddingScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => VehicleAddingScreen());
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
              body: Center(child: Text("Screen does not exist!"))));
  }
}
