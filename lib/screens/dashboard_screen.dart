import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kin/constants/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.home,
          size: 30,
        ),
        title: Text(
          'KIN',
          style: GoogleFonts.philosopher(
            fontWeight: FontWeight.bold,
            color: kGold,
          ),
        ),
        actions: [
          DropdownButton<String>(
            style: GoogleFonts.muli(
              color: kGold,
              fontSize: 16.0,
            ),
            underline: Container(),
            icon: Container(
              decoration: BoxDecoration(
                color: kGold,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 30,
                color: Colors.black,
              ),
            ),
            items: <String>["We Get To Give", "Privacy Policy"]
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: kdark,
        ),
      ),
    );
  }
}
