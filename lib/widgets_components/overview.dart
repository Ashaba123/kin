import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kin/constants/constants.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "OverView",
            style: GoogleFonts.philosopher(
              fontSize: 24,
              color: kGold,
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            "Kingdom Influencers Network",
            textAlign: TextAlign.center,
            style: GoogleFonts.muli(
              fontSize: 16.0,
            ),
          ),
          Divider(
            color: kGold,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Main Thing",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Kin Declaration",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
