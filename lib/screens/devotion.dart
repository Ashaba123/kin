import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/devotion_model.dart';

class Devotions extends StatelessWidget {
  const Devotions({Key? key}) : super(key: key);

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
            "Devotion",
            style: TextStyle(
              color: kGold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: devotions
              .map(
                (devotion) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
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
                          devotion.scripture,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          devotion.text,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ));
  }
}
