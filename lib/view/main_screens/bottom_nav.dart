import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fintrack/homepage.dart';
import 'package:fintrack/love.dart';
import 'package:fintrack/profile.dart';
import 'package:fintrack/search.dart';
import 'package:flutter/material.dart';


class BottomNavScreen extends StatefulWidget {
   const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  var screens =const [
    HomePage(),
    Search(),
    Love(),
    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        buttonBackgroundColor: Colors.lightGreen,

        backgroundColor: Colors.white,
        color: Colors.lightBlue,
        height: 50,
        items:const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      
    );
    
  }
}