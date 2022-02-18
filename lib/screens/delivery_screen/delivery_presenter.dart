import 'package:delivery/api/repo.dart';
import 'package:delivery/models/event_model.dart';
import 'package:delivery/screens/base/base_presenter.dart';
import 'package:delivery/screens/delivery_screen/delivery_view_model.dart';
import 'package:delivery/screens/home_screen/home_presenter.dart';

class DeliveryPresenter extends BasePresenter<DeliveryViewModel> {
  DeliveryPresenter(DeliveryViewModel model) : super(model);

  Repository repository = Repository();

  List<EventModel> events = [];

  Future<void> getEvents() async {
    startLoading();
    // List<EventModel> events = await repository.getEvents();
    List<EventModel> result = mockEvents;
    for (EventModel event in result) {
      if (event.eventTypeId == 5 || event.eventTypeId == 6 || event.eventTypeId == 7) {
        events.add(event);
      }
    }
    endLoading();
    updateView();
  }

  Future<void> confirmEvent(EventModel eventModel) async {
    startLoading();
    //TODO: подтверждение ивента
    await repository.postEvent(eventModel);
    events.remove(eventModel);
    updateView();
    endLoading();
  }

  @override
  void onInitWithContext() {
    super.onInitWithContext();
    getEvents();
  }
}
