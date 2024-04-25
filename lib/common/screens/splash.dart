import 'package:fintrack/feature/auth/screen/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/bottom_nav.dart';
import 'onboarding_pages/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    gotoHome(context);
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'FinTrack',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> gotoHome(context) async {
    final sharedprifes = await SharedPreferences.getInstance();
    String? isLogined = sharedprifes.getString('x-auth-token');

    await Future.delayed(const Duration(seconds: 3));

    if (isLogined == null) {
      // ignore: use_build_context_synchronously
      Get.to(const AuthScreen());
    } else {
      // ignore: use_build_context_synchronously
      Get.offAll(const BottomNavScreen());
    }
  }
}
