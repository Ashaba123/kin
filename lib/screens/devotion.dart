import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kin/bloc/devotion_bloc.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/devotion_model.dart';

import 'package:provider/provider.dart';

class Devotions extends StatelessWidget {
  const Devotions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdark,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kGold,
          size: 24,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Devotion",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<QueryDocumentSnapshot<Devotion>>>(
        stream: context.read<DevotionBloc>().getAllDevotions(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error in devotions'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: kGold,
              ),
            );
          }
          if (snapshot.data!.isEmpty) {
            return const Center(child: Text('Devotions will be uploaded'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: ((context, index) {
              final devotion = snapshot.data![index].data();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      kGold,
                      Colors.yellow.shade800,
                    ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        devotion.scripture!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        devotion.text!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
