import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';

//Fix the problem here... 
class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  int selectedIndex;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/dashboard');
        break;
      case 1:
        Navigator.pushNamed(context, '/sermons');
        break;
      case 2:
        Navigator.pushNamed(context, '/details');
        break;
      default:
    }
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kGold,
      unselectedItemColor: Colors.black87.withOpacity(0.6),
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
      currentIndex: widget.selectedIndex,
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
    );
  }
}
