import 'package:flutter/material.dart';
import 'package:kin/components/bottom_navigation.dart';
import 'package:kin/models/testimony_model.dart';

import '../constants/constants.dart';

class Testimonies extends StatelessWidget {
  const Testimonies({Key? key}) : super(key: key);

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
          "Testimonies",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
      body: ListView(
        children: testimonies
            .map(
              (testimony) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      kGold,
                      Colors.yellow.shade800,
                    ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimony.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        testimony.testimony,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
