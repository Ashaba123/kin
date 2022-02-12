import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/widgets_components/carousel.dart';

import '../widgets_components/overview.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdark,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.home,
          color: kGold,
          size: 30,
        ),
        centerTitle: true,
        title: Text(
          'KIN',
          style: GoogleFonts.philosopher(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: kGold,
          ),
        ),
        actions: [
          DropdownButton<String>(
            style: GoogleFonts.muli(
              color: kGold,
              // fontSize: 16.0,
            ),
            underline: Container(),
            icon: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: kGold,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.menu,
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kGold,
        unselectedItemColor: Colors.black87.withOpacity(0.6),
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Sermons",
            icon: Icon(
              Icons.headphones,
            ),
          ),
          BottomNavigationBarItem(
            label: "More",
            icon: Icon(
              Icons.more_vert_rounded,
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: kdark,
        ),
        child: Column(
          children: const [
            CarouselWithIndicatorDemo(),
            OverView(),
          ],
        ),
      ),
    );
  }
}
