import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kin/bloc/devotion_bloc.dart';
import 'package:kin/bloc/event_bloc.dart';
import 'package:kin/bloc/life_group_bloc.dart';
import 'package:kin/bloc/testimony_bloc.dart';
import 'package:kin/repositories/devotion_repository.dart';
import 'package:kin/repositories/event_repository.dart';
import 'package:kin/repositories/life_group_repository.dart';
import 'package:kin/repositories/testimony_repository.dart';
import 'package:kin/screens/app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (_) => DevotionBloc(iDevotionRepository: DevotionRepository()),
      ),
      Provider(
        create: (_) => EventBloc(iEventRepository: EventRepository()),
      ),
      Provider(
        create: (_) =>
            TestimonyBloc(iTestimonyRepository: TestimonyRepository()),
      ),
      Provider(
        create: (_) =>
            LifeGroupBloc(iLifeGroupRepository: LifeGroupRepository()),
      ),
    ],
    child: const MyApp(),
  ));
}
