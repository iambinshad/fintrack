import 'package:flutter/material.dart';

const String url = "http://192.168.0.126:3000/";

var kHeight10 = const SizedBox(
  height: 10,
);
var kHeight15 = const SizedBox(
  height: 15,
);
var kHeight20 = const SizedBox(
  height: 20,
);
var kHeight50 = const SizedBox(
  height: 50,
);
TextStyle appBarTitleStyle =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
var headTextStyle = const TextStyle(
    fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold);

class GlobalVarialble {
  static const secondaryColor = Color.fromRGBO(37, 30, 21, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}
