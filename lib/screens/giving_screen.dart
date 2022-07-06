import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';

class GivingScreen extends StatelessWidget {
  const GivingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kdark.withOpacity(0.8),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/give.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "WAYS TO GIVE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: kGold,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Mobile Money",
                      style: TextStyle(
                        fontSize: 20,
                        color: kGold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        PaymentCard(
                            phoneNo: "0789936333", imgUrl: "images/mtn.png"),
                        PaymentCard(
                          phoneNo: '0706859641',
                          imgUrl: 'images/airtel.png',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Banks",
                      style: TextStyle(
                        fontSize: 20,
                        color: kGold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        PaymentCard(
                          phoneNo: "01404690009",
                          imgUrl: "images/boa.jpg",
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    required this.phoneNo,
    required this.imgUrl,
    Key? key,
  }) : super(key: key);

  final String phoneNo;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(0),
          child: Image(
            width: 150,
            height: 100,
            image: AssetImage(imgUrl),
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          phoneNo,
          style: TextStyle(
            fontSize: 18,
            color: kGold,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
