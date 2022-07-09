import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';
import '../components/carousel.dart';
import '../components/core_values.dart';
import '../components/divider.dart';
import '../components/overview.dart';
import '../components/pastors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'images/logo.png',
          width: 100,
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        actions: [
          DropdownButton<String>(
            underline: Container(
              color: Colors.amber.withOpacity(0.8),
            ),
            dropdownColor: kGold,
            icon: Container(
              padding: const EdgeInsets.only(right: 4),
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
                "OUR PASTORS",
                style: TextStyle(
                  fontSize: 24.0,
                  color: kGold,
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 170, child: PastorsWidget()),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
