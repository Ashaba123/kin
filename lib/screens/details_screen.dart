import 'package:flutter/material.dart';
import 'package:kin/components/bottom_navigation.dart';
import 'package:kin/constants/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdark,
      appBar: AppBar(
        title: Text(
          "MORE",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 2,
      ),
      body: Column(
        children: [
          const CardBox(name: "Life Groups"),
          const CardBox(name: "Upcoming Events"),
          const CardBox(name: "Devotions"),
          const CardBox(name: "Testimonies"),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text(
                  "Visit Our Website",
                  style: TextStyle(
                    color: kGold,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    "kinministriesint.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardBox extends StatelessWidget {
  const CardBox({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (name) {
          case "Life Groups":
            Navigator.pushNamed(context, "/lifeGroups");
            break;
          case "Upcoming Events":
            Navigator.pushNamed(context, "/events");
            break;
          case "Devotions":
            Navigator.pushNamed(context, "/devotions");
            break;
          case "Testimonies":
            Navigator.pushNamed(context, "/testimonies");
            break;
          default:
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(colors: [
            kGold,
            Colors.amber.shade600,
          ]),
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
