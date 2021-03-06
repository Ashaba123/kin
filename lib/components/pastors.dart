import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kin/bloc/pastor_bloc.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/pastors.dart';
import 'package:provider/provider.dart';

class PastorsWidget extends StatelessWidget {
  const PastorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String defaultImgUrl =
        'https://firebasestorage.googleapis.com/v0/b/kin-app-12f22.appspot.com/o/Pastors%2Fkinlogo.PNG?alt=media&token=7bf5f35f-9197-49bd-b254-1de92f2bc067';

    return StreamBuilder<List<QueryDocumentSnapshot<PastorsModel>>>(
        stream: context.read<PastorBloc>().getAllPastors(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error in Pastors'),
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
            return const Center(child: Text('Pastors will be added'));
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                final pastor = snapshot.data![index].data();

                return Container(
                  margin: const EdgeInsets.only(left: 16, top: 5),
                  child: Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 3, style: BorderStyle.none),
                          image: DecorationImage(
                            image: NetworkImage(pastor.imgUrl == ""
                                ? defaultImgUrl
                                : pastor.imgUrl!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        pastor.pastorName!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kGold, fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                );
              });
        }));
  }
}
