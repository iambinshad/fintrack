

import 'package:fintrack/view/mini_screens/onboarding/onboarding_pages/page_1.dart';
import 'package:fintrack/view/mini_screens/onboarding/onboarding_pages/page_2.dart';
import 'package:fintrack/view/mini_screens/onboarding/onboarding_pages/page_3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../controller/provider/onboarding.dart';
import '../../../main_screens/bottom_nav.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({super.key});

  int? enter = 0;

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Consumer<OnBoardingProvider>(
              builder: (context, value, child) {
                return PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    value.isLastPage(index);
                  },
                  children: const [
                    IntroPage1(),
                    IntroPage2(),
                    IntroPage3(),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Provider.of<OnBoardingProvider>(context).skipbutton
                        ? null
                        : Container(
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 35, 68, 199)),
                            child: Center(
                                child: GestureDetector(
                              onTap: () {
                                _controller.jumpToPage(2);
                              },
                              child: const Text(
                                'skip',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          ),
                  ),
              ],
            ),
           
            Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SmoothPageIndicator(controller: _controller, count: 3,),
                  Provider.of<OnBoardingProvider>(context).onLastPage
                      ? Consumer<OnBoardingProvider>(
                        builder: (context, value, child) => 
                        GestureDetector(
                        onTap: () {
                     value.entryCounting();
                           Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return  const BottomNavScreen();
                          }), (route) => false);
                        },
                        child: Container(
                          height: 38,
                          width: 120,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:const Color.fromARGB(255, 35, 68, 199) ),
                          child: const Center(child: Text('Get Started',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                        ),
                      )
                       
                      )
                      : 
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeIn);
                        },
                        child: Container(
                          height: 38,
                          width: 120,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:const Color.fromARGB(255, 35, 68, 199) ),
                          child: const Center(child: Text('Next',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                        ),
                      )
                      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 

  Future<void> saveEnterCountTosharedPrference() async {
    //Shared Preference
    final sharedprefs = await SharedPreferences.getInstance();
    //save enterence
    await sharedprefs.setInt('enterCount', enter!);
  }
}
