import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fintrack/controller/provider/common_provider.dart';
import 'package:fintrack/feature/home/screens/homepage.dart';
import 'package:fintrack/feature/report/screens/love.dart';
import 'package:fintrack/feature/profile/screens/profile.dart';
import 'package:fintrack/feature/transaction/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  static const String routeName = "/bottomNav";
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  var screens = [
    HomePage(),
    const Search(),
    const Love(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final CommonProvider cmp = Get.put(CommonProvider());
    return Scaffold(
      body: Obx(() => screens[int.parse(cmp.selectedIndex.toString())]),
      bottomNavigationBar: CurvedNavigationBar(
        index: int.parse(cmp.selectedIndex.toString()),
        buttonBackgroundColor: const Color.fromARGB(255, 225, 226, 224),
        backgroundColor: Colors.white,
        color: Colors.lightBlue,
        height: 50,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          cmp.selectedIndex = RxInt(index);
        },
      ),
    );
  }
}
