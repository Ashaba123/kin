import 'package:firebase_storage/firebase_storage.dart';
import 'package:kin/models/events_model.dart';

abstract class IEventRepository {
  Future<List<EventModel>> getAllEvents();
}

class EventRepository extends IEventRepository{
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) {
    return Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
  }

  @override
  Future<List<EventModel>> getAllEvents() async {
    final ref = FirebaseStorage.instance.ref('Events/');
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          // final name = ref.name;
          final file = EventModel(ref: ref,  imgUrl: url);
          return MapEntry(index, file);
        })
        .values
        .toList();
  }
  

}