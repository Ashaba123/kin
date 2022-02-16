import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kGold,
            Colors.amber,
          ],
        ),
      ),
      child: const Divider(
        thickness: 2,
        height: 3,
        color: Colors.transparent,
      ),
    );
  }
}
