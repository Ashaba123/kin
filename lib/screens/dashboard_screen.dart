import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/screens/details_screen.dart';
import 'package:kin/screens/home_screen.dart';
import 'package:kin/screens/sermons_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  List<int> prevIndexes = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (prevIndexes.isNotEmpty) {
          setState(() => currentIndex = prevIndexes.removeLast());
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(left: 120.0),
            child: Image.asset(
              'images/logo.png',
              height: 60,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          centerTitle: true,
          actions: [
            DropdownButton<String>(
              underline: Container(
                color: Colors.amber.withOpacity(0.8),
              ),
              dropdownColor: kGold,
              icon: Container(
                padding: const EdgeInsets.only(right: 6, top: 10),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.amber,
                ),
              ),
              items: <String>[
                "We Get To Give",
                "Privacy Policy",
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                switch (_) {
                  case "We Get To Give":
                    Navigator.pushNamed(context, '/giving');
                    break;
                  case "Privacy Policy":
                    break;
                  default:
                }
              },
            ),
          ],
        ),
        backgroundColor: kdark,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kGold,
                Colors.amber,
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.amber.shade400,
                  Colors.amber,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.black87.withOpacity(0.6),
              selectedItemColor: Colors.black,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  prevIndexes.add(currentIndex);
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
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
        ),
        body: Stack(
          children: [
            Offstage(
              offstage: currentIndex != 0,
              child: const HomeScreen(),
            ),
            Offstage(
              offstage: currentIndex != 1,
              child: const SermonsScreen(),
            ),
            Offstage(
              offstage: currentIndex != 2,
              child: const DetailsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
