import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kin/dependecies.dart';
import 'package:kin/screens/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Dependecies(
    child: MyApp(),
  ));
}
