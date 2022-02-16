import 'package:flutter/material.dart';
import 'package:kin/components/bottom_navigation.dart';
import 'package:kin/constants/constants.dart';

class Devotions extends StatelessWidget {
  const Devotions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Devotion",
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
