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
        leading: Icon(
          Icons.home,
          color: kGold,
          size: 30,
        ),
        title: Image.asset(
          'images/logo.png',
          width: 120,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
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
                  fontSize: 24,
                  color: kGold,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 3,
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
