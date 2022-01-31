import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kin/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KIN',
      darkTheme: ThemeData(
          primarySwatch: Colors.deepOrange, primaryColor: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset(
            'images/logo.png',
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          nextScreen: const DashboardScreen(),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.black),
    );
  }
}
