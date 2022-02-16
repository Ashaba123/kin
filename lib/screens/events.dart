import 'package:flutter/material.dart';
import 'package:kin/components/bottom_navigation.dart';

import '../constants/constants.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> eventImages = [
      "images/img-1.jpeg",
      "images/img-2.jpeg",
      "images/img-1.jpeg",
      "images/img-2.jpeg",
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kGold,
          size: 24,
        ),
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
      body: ListView(
        children: eventImages
            .map(
              (eventImage) => Card(
                color: Colors.transparent,
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 16,
                  bottom: 10,
                  right: 16,
                ),
                child: Image(
                  image: AssetImage(eventImage),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
