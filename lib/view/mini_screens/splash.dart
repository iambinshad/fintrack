import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main_screens/bottom_nav.dart';
import 'onboarding/onboarding_pages/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  late SharedPreferences sharedPreferences;

  dynamic savedValue;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gotoHome(context);
      getDataFromSharedPreference();
    });
    getDataFromSharedPreference();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: 
                  Text(
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
    await Future.delayed(const Duration(seconds: 3));
    if (savedValue == null) {
      
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return OnBoardingScreen();
      }), (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return  OnBoardingScreen();
      }), (route) => false);
    }
  }

  Future<void> getDataFromSharedPreference() async {
    final sharedprifes = await SharedPreferences.getInstance();

    savedValue = sharedprifes.getInt('enterCount');
  }
}
