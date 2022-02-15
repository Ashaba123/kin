import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kin/components/core_values.dart';
import 'package:kin/components/divider.dart';
import 'package:kin/components/pastors.dart';
import 'package:kin/constants/constants.dart';
import '../components/carousel.dart';
import '../components/overview.dart';

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
            underline: Container(),
            dropdownColor: kGold,
            icon: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.8),
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              kGold,
              Colors.yellow,
            ],
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: kGold.withOpacity(0.6),
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
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: kdark,
          ),
          child: Column(
            children: [
              const CarouselWithIndicatorDemo(),
              const OverView(),
              const CoreValues(),
              Text(
                "Our Pastors",
                style: GoogleFonts.philosopher(
                  fontSize: 24,
                  color: kGold,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 16,
                  right: 16,
                ),
                child: CustomDivider(),
              ),
              const SizedBox(
                height: 150,
                child: PastorsWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
