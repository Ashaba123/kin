import 'package:flutter/material.dart';
import 'package:kin/components/divider.dart';
import 'package:kin/constants/constants.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kingdom Influencers Network",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: kGold,
            ),
          ),
          const SizedBox(height: 5.0),
          const SizedBox(height: 5.0),
          SizedBox(
            height: 190,
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
                mainAxisExtent: 180,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Main Thing",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const CustomDivider(),
                      const SizedBox(height: 12),
                      Text(
                        kmainThing,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        "Kin Declaration",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const CustomDivider(),
                      const SizedBox(height: 12),
                      Text(
                        kKinDeclaration,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
