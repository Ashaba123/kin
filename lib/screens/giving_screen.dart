import 'package:flutter/material.dart';
import '../constants/constants.dart';

class GivingScreen extends StatelessWidget {
  const GivingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kGold,
          size: 24,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "We Get To Give",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            "Kingdom Influencers Network",
            style: TextStyle(
              color: kGold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
