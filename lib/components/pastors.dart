import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/pastors.dart';

class PastorsWidget extends StatelessWidget {
  const PastorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pastors.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, index) => Container(
        margin: const EdgeInsets.only(left: 16, top: 5),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: kGold,
                  width: 3,
                ),
                image: const DecorationImage(
                  image: AssetImage("images/Israel.jpg"),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              pastors[index].name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kGold,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
