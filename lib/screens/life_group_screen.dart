import 'package:flutter/material.dart';
import 'package:kin/components/bottom_navigation.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/life_groups_model.dart';

class LifeGroups extends StatelessWidget {
  const LifeGroups({Key? key}) : super(key: key);

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
          "Life Groups",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2),
      body: ListView(
        children: lifeGroups
            .map((lifeGroup) => Container(
                  padding: const EdgeInsets.all(10.0),
                  margin:
                      const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
                  decoration: BoxDecoration(
                    color: kGold,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white.withOpacity(0.1),
                        child: Icon(
                          lifeGroup.icon,
                          color: Colors.black,
                          size: 50,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lifeGroup.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            lifeGroup.phone,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            lifeGroup.location,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
