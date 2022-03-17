import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kin/models/events_model.dart';
import 'package:kin/repositories/event_repository.dart';

class EventBloc {
  final IEventRepository iEventRepository;

  EventBloc({required this.iEventRepository});

  Stream<List<QueryDocumentSnapshot<EventModel>>> getAllEvents() {
    return iEventRepository.getAllEvents();
  }
}
