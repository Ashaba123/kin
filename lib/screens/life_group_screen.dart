import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kin/bloc/life_group_bloc.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/life_groups_model.dart';
import 'package:provider/provider.dart';

class LifeGroups extends StatelessWidget {
  const LifeGroups({Key? key}) : super(key: key);

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
          "Life Groups",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<QueryDocumentSnapshot<LifeGroupsModel>>>(
          stream: context.read<LifeGroupBloc>().getAllLifeGroups(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              const Center(
                child: Text('Error in Life Groups'),
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
              return const Center(child: Text('Life will be uploaded'));
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final lifeGroup = snapshot.data![index].data();

                  return Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(
                          top: 10.0, left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        color: kGold,
                      ),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lifeGroup.groupName!,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              lifeGroup.location!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              lifeGroup.phone!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ]));
                });
          }),
    );
  }
}
// Container(
//                   padding: const EdgeInsets.all(10.0),
//                   margin:
//                       const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
//                   decoration: BoxDecoration(
//                     color: kGold,
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(10),
//                         color: Colors.white.withOpacity(0.1),
//                         child: Icon(
//                           lifeGroup.icon,
//                           color: Colors.black,
//                           size: 50,
//                         ),
//                       ),
//                       const SizedBox(width: 15),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             lifeGroup.name,
//                             style: const TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             lifeGroup.phone,
//                             style: const TextStyle(
//                               fontSize: 16,
//                             ),
//                           ),
//                           Text(
//                             lifeGroup.location,
//                             style: const TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ))