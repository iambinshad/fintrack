import 'dart:convert';
import 'dart:developer';

import 'package:fintrack/common/widgets/bottom_nav.dart';
import 'package:fintrack/constants/error_handling.dart';
import 'package:fintrack/constants/global_varialbles.dart';
import 'package:fintrack/constants/utils.dart';
import 'package:fintrack/controller/provider/onboarding.dart';
import 'package:fintrack/feature/home/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final UserProvider uPro = Get.put(UserProvider());

  signUpUser(
      {required name,
      required password,
      required email,
      required context}) async {
    try {
      final user = jsonEncode({
        "name": name,
        "email": email,
        "password": password,
      });

      http.Response response = await http.post(Uri.parse(url + "api/signup"),
          body: user,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      log(response.body);

      httpErrorHandle(
          res: response,
          context: context,
          onSuccess: () async {
            showSnackBar(
                context, "Account created!, Login with the same credential");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInUser(
      {required password, required email, required context}) async {
    try {
      final user = jsonEncode({"email": email, "password": password});

      http.Response response = await http.post(Uri.parse(url + "api/signin"),
          body: user,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          res: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            uPro.setUser(response.body);
            await prefs.setString(
                "x-auth-token", jsonDecode(response.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomNavScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //getUserData
  Future<void> getUserData({required context}) async {
    try {
      log("clicked");

      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("x-auth-token");
      if (token == null) {
        log("Token is null");
        // Handle the case where the token is null (e.g., prompt user to log in)
        return;
      }

      // Make a POST request to check if the token is valid
      final tokenRes = await http.post(
        Uri.parse("${url}isTokenValid"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token.trim(),
        },
      );

      log(tokenRes.body.toString(), name: "Token Validation Response");

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        // If token is valid, make a GET request to fetch user data
        final userResponse = await http.get(
          Uri.parse("$url/"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        log(userResponse.body.toString(), name: "User Data");

        uPro.setUser(userResponse.body);
      } else {
        // Handle the case where the token is not valid (e.g., prompt user to log in again)
        log("Token is not valid");
      }
    } catch (e) {
      log("Error: $e");
      showSnackBar(context, e.toString());
    }
  }
}
