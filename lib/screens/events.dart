import 'package:flutter/material.dart';
import 'package:kin/components/bottom_navigation.dart';

import '../constants/constants.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Events",
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
