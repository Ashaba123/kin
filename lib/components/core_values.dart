import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            "Core Values",
            style: GoogleFonts.philosopher(
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
                    style: GoogleFonts.philosopher(
                      fontSize: 50,
                      color: kGold,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "Roman 1:14-9",
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