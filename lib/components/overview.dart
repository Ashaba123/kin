import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kin/components/divider.dart';
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
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            "Kingdom Influencers Network",
            textAlign: TextAlign.center,
            style: GoogleFonts.muli(
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
          Row(
            children: [
              Expanded(
                child: Card(
                  color: kGold,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Main Thing",
                          style: GoogleFonts.philosopher(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          kmainThing,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Card(
                  color: kGold,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kin Declaration",
                          style: GoogleFonts.philosopher(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          kKinDeclaration,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
