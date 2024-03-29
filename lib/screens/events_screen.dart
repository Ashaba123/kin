import 'package:flutter/material.dart';
import 'package:kin/constants/constants.dart';
import 'package:kin/models/events_model.dart';
import 'package:kin/provider/event_provider.dart';
import 'package:provider/provider.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

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
          "Events",
          style: TextStyle(
            color: kGold,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<EventModel>>(
          stream: context.read<EventProvider>().getAllEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error in events'),
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
                'Events will be uploaded',
                style: TextStyle(color: kGold),
              ));
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final event = snapshot.data![index];
                  return EventCard(event: event);
                });
          }),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.only(
        top: 10,
        left: 16,
        bottom: 10,
        right: 16,
      ),
      child: Image(
        image: NetworkImage(event.imgUrl!),
      ),
    );
  }
}
