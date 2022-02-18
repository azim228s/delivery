import 'package:delivery/api/api.dart';
import 'package:delivery/models/event_model.dart';

class Repository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<EventModel>> getEvents() async {
    var res = await _apiProvider.fetchGetRequest();

    List<EventModel> events = List<EventModel>.from(
      res.map(
            (x) => EventModel.fromJson(x),
      ),
    );

    return events;
  }

  Future<void> postEvent(EventModel eventModel) async {
    await _apiProvider.fetchPostRequest(
      eventModel.toJson()
    );
  }

}
