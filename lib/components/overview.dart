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
            "OVERVIEW",
            style: TextStyle(
              fontSize: 24,
              color: kGold,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            "Kingdom Influence's Network",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              color: kGold,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const CustomDivider(),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 150,
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 3 / 2.5,
              ),
              children: [
                Card(
                  color: kGold,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Main Thing",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          kmainThing,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: kGold,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Kin Declaration",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          kKinDeclaration,
                        ),
                      ],
                    ),
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
