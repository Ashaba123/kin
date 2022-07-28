import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kin/components/divider.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/declaration.dart';
import 'package:kin/provider/declaration_provider.dart';
import 'package:provider/provider.dart';

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kingdom Influencers Network",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: kGold,
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "Main Thing",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const CustomDivider(),
                const SizedBox(height: 12),
                Text(
                  kmainThing,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "KIN Declaration",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const CustomDivider(),
                const SizedBox(height: 12),
                StreamBuilder<List<QueryDocumentSnapshot<Declaration>>>(
                    stream:
                        context.read<DeclarationProvider>().getKinDeclaration(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kGold,
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kGold,
                          ),
                        );
                      }
                      return Text(
                        "${snapshot.data![0].data().title}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.amber,
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
