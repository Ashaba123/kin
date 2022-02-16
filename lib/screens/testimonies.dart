import 'package:flutter/material.dart';
import 'package:kin/components/bottom_navigation.dart';

import '../constants/constants.dart';

class Testimonies extends StatelessWidget {
  const Testimonies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Testimonies",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
    );
  }
}
