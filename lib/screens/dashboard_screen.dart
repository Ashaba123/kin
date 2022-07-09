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
