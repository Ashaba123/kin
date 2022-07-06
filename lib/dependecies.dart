import 'package:flutter/material.dart';
import 'package:kin/bloc/devotion_bloc.dart';
import 'package:kin/bloc/event_bloc.dart';
import 'package:kin/bloc/life_group_bloc.dart';
import 'package:kin/bloc/pastor_bloc.dart';
import 'package:kin/bloc/sermon_bloc.dart';
import 'package:kin/bloc/testimony_bloc.dart';
import 'package:kin/repositories/devotion_repository.dart';
import 'package:kin/repositories/event_repository.dart';
import 'package:kin/repositories/life_group_repository.dart';
import 'package:kin/repositories/pastors_repository.dart';
import 'package:kin/repositories/sermon_repository.dart';
import 'package:kin/repositories/testimony_repository.dart';
import 'package:provider/provider.dart';

class Dependecies extends StatelessWidget {
  const Dependecies({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) =>
              DevotionBloc(iDevotionRepository: DevotionRepository()),
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
        Provider(
          create: (_) => PastorBloc(iPastoryRepository: PastorRepostory()),
        ),
        Provider(
          create: (_) => SermonBloc(iSermonRepository: SermonRepository()),
        ),
      ],
      child: child,
    );
  }
}
