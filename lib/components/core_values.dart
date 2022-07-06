import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CoreValues extends StatelessWidget {
  const CoreValues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          Text(
            "CORE VALUES",
            style: TextStyle(
              fontSize: 24,
              color: kGold,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          Divider(
            color: kGold,
            thickness: 2,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Values(value: "Obligated"),
                    SizedBox(height: 5),
                    Values(value: "Not Ashamed"),
                    SizedBox(height: 5),
                    Values(value: "Eager"),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    "ONE",
                    style: TextStyle(
                      fontSize: 50,
                      color: kGold,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "Romans 1:14-16",
                    style: TextStyle(color: kGold),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}

class Values extends StatelessWidget {
  const Values({
    required this.value,
    Key? key,
  }) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: TextStyle(
            color: kGold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
