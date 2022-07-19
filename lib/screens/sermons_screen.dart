import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kin/bloc/sermon_bloc.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/sermon_model.dart';
import 'package:kin/screens/player_screen.dart';
import 'package:provider/provider.dart';

class SermonsScreen extends StatelessWidget {
  const SermonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kdark,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 3,
        iconTheme: IconThemeData(
          color: kGold,
          size: 24,
        ),
        title: Text(
          'SERMONS',
          style: TextStyle(
            color: kGold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<QueryDocumentSnapshot<SermonModel>>>(
                stream: context.read<SermonBloc>().getAllSermons(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    const Center(
                      child: Text('Error in Sermons'),
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
                    return Center(
                        child: Text(
                      'Sermons will be uploaded',
                      style: TextStyle(color: kGold),
                    ));
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final sermon = snapshot.data![index].data();
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => MusicPlayer(
                                    sermon: sermon,
                                  )),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            margin: const EdgeInsets.only(
                              top: 20.0,
                              left: 8.0,
                              right: 8.0,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                kGold.withOpacity(0.6),
                                Colors.amber.withOpacity(0.7),
                              ]),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(blurRadius: 0.1),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: kGold,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: kdark,
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      sermon.sermonName!.toUpperCase(),
                                      style: TextStyle(
                                        color: kdark,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      sermon.pastorName!,
                                      style: TextStyle(
                                        color: kdark.withOpacity(
                                          0.9,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
