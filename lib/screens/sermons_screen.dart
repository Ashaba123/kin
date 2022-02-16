import 'package:flutter/material.dart';
import 'package:kin/components/bottom_navigation.dart';
import 'package:kin/constants/constants.dart';

class SermonsScreen extends StatelessWidget {
  const SermonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SERMONS",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1),
    );
  }
}
