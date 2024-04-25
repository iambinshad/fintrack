import 'package:fintrack/common/screens/splash.dart';
import 'package:fintrack/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.red,
      ),
      
      home: SplashScreen(),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      debugShowCheckedModeBanner: false,
    );
  }
}
