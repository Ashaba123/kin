import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'KIN',
      darkTheme: ThemeData(
        primaryColor: kdark,
        textTheme: GoogleFonts.muliTextTheme(textTheme).copyWith(
          headline1: GoogleFonts.philosopher(textStyle: textTheme.headline1),
          headline6: GoogleFonts.philosopher(textStyle: textTheme.headline6),
          bodyText1: GoogleFonts.muli(textStyle: textTheme.bodyText2),
        ),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
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
        backgroundColor: kdark,
      ),
    );
  }
}
