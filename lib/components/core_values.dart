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
              fontSize: 24.0,
              color: kGold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 8),
                        Values(value: "Obligated"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 8),
                        Values(value: "Not Ashamed"),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(width: 8),
                        Values(value: "Eager"),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "ONE",
                      style: TextStyle(
                        fontSize: 48,
                        color: kGold,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      "Romans 1 : 14-16",
                      style: TextStyle(color: kGold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
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
