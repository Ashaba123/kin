import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';
import '../components/carousel.dart';
import '../components/core_values.dart';
import '../components/overview.dart';
import '../components/pastors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: kdark,
          ),
          child: Column(
            children: [
              const CarouselWithImages(),
              const OverView(),
              const CoreValues(),
              Text(
                "OUR PASTORS",
                style: TextStyle(
                  fontSize: 24.0,
                  color: kGold,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 170, child: PastorsWidget()),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
