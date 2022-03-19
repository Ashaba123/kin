import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kin/bloc/devotion_bloc.dart';
import 'package:kin/bloc/testimony_bloc.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/repositories/devotion_repository.dart';
import 'package:kin/repositories/testimony_repository.dart';
import 'package:kin/screens/dashboard_screen.dart';
import 'package:kin/screens/devotion.dart';
import 'package:kin/screens/events_screen.dart';
import 'package:kin/screens/giving_screen.dart';
import 'package:kin/screens/life_group_screen.dart';
import 'package:kin/screens/testimonies.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider(
          create: (_) =>
              DevotionBloc(iDevotionRepository: DevotionRepository())),
      // Provider(create: (_) => EventBloc(iEventRepository: EventReposotory())),
      Provider(
          create: (_) =>
              TestimonyBloc(iTestimonyRepository: TestimonyRepository())),
    ],
    child: const MyApp(),
  ));
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
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
          headline1: GoogleFonts.poppins(textStyle: textTheme.headline1),
          headline6: GoogleFonts.poppins(textStyle: textTheme.headline6),
          bodyText1: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
        ),
      ),
      routes: {
        '/lifeGroups': (context) => const LifeGroups(),
        '/events': (context) => const EventsScreen(),
        '/devotions': (context) => const Devotions(),
        '/testimonies': (context) => const Testimonies(),
        '/giving': (context) => const GivingScreen(),
      },
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
