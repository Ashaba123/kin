import 'package:flutter/material.dart';
import 'package:kin/provider/declaration_provider.dart';
import 'package:kin/provider/devotion_provider.dart';
import 'package:kin/provider/event_provider.dart';
import 'package:kin/provider/life_group_provider.dart';
import 'package:kin/provider/pastor_provider.dart';
import 'package:kin/provider/sermon_provider.dart';
import 'package:kin/repositories/declaration_repository.dart';
import 'package:kin/repositories/devotion_repository.dart';
import 'package:kin/repositories/event_repository.dart';
import 'package:kin/repositories/life_group_repository.dart';
import 'package:kin/repositories/pastors_repository.dart';
import 'package:kin/repositories/sermon_repository.dart';
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
          create: (_) => DeclarationProvider(
              iDeclarationRepository: DeclarationRepository()),
        ),
        Provider(
          create: (_) => PastorProvider(iPastoryRepository: PastorRepostory()),
        ),
        Provider(
          create: (_) => SermonProvider(iSermonRepository: SermonRepository()),
        ),
        Provider(
          create: (_) => EventProvider(iEventRepository: EventRepository()),
        ),
        Provider(
          create: (_) =>
              LifeGroupProvider(iLifeGroupRepository: LifeGroupRepository()),
        ),
        Provider(
          create: (_) =>
              DevotionProvider(iDevotionRepository: DevotionRepository()),
        ),
      ],
      child: child,
    );
  }
}
