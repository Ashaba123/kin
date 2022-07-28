import 'package:kin/models/events_model.dart';
import 'package:kin/repositories/event_repository.dart';

class EventProvider {
  final IEventRepository iEventRepository;

  EventProvider({required this.iEventRepository});

  Stream<List<EventModel>> getAllEvents() {
    return iEventRepository.getAllEvents();
  }
}
