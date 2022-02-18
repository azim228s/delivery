import 'package:delivery/api/repo.dart';
import 'package:delivery/models/event_model.dart';
import 'package:delivery/models/location_model.dart';
import 'package:delivery/screens/base/base_presenter.dart';
import 'package:delivery/screens/home_screen/home_view_model.dart';

class HomePresenter extends BasePresenter<HomeViewModel> {
  HomePresenter(HomeViewModel model) : super(model);

  Repository repository = Repository();

  List<EventModel> offers = [];

  Future<void> getEvents() async {
    startLoading();
    updateView();
    // List<EventModel> events = await repository.getEvents();
    List<EventModel> events = mockEvents;
    for (EventModel event in events) {
      if (event.eventTypeId == 2) {
        offers.add(event);
      }
    }
    endLoading();
    updateView();
  }

  Future<void> acceptOffer(EventModel eventModel) async {
    startLoading();
    updateView();
    // await repository.postEvent(eventModel);
    offers.remove(eventModel);
    //WARNING: only for mock
    mockEvents.remove(eventModel);
    mockEvents.add(eventModel.copyWith(5));
    endLoading();
    updateView();
  }

  @override
  void onInitWithContext() {
    super.onInitWithContext();
    getEvents();
  }
}

List<EventModel> mockEvents = [
  EventModel(
    id: 1,
    offerId: 1,
    eventTypeId: 2,
    weightKg: 333,
    expectingDeliveryDate: DateTime.now(),
    date: DateTime.now(),
    offeredPriceTenge: 200201,
    reason: '',
    deliveryCompanyId: 1,
    fromLocation: LocationModel(
      name: 'from',
      longitude: 0,
      latitude: 0,
    ),
    toLocation: LocationModel(
      name: 'to',
      longitude: 0,
      latitude: 0,
    ),
  ),
  EventModel(
    id: 2,
    offerId: 1,
    eventTypeId: 2,
    weightKg: 666,
    expectingDeliveryDate: DateTime.now(),
    date: DateTime.now(),
    offeredPriceTenge: 200202,
    reason: '',
    deliveryCompanyId: 2,
    fromLocation: LocationModel(
      name: 'from',
      longitude: 0,
      latitude: 0,
    ),
    toLocation: LocationModel(
      name: 'to',
      longitude: 0,
      latitude: 0,
    ),
  ),
  EventModel(
    id: 3,
    offerId: 1,
    eventTypeId: 2,
    weightKg: 999,
    expectingDeliveryDate: DateTime.now(),
    date: DateTime.now(),
    offeredPriceTenge: 200203,
    reason: '',
    deliveryCompanyId: 3,
    fromLocation: LocationModel(
      name: 'from',
      longitude: 0,
      latitude: 0,
    ),
    toLocation: LocationModel(
      name: 'to',
      longitude: 0,
      latitude: 0,
    ),
  ),
  EventModel(
    id: 4,
    offerId: 1,
    eventTypeId: 5,
    weightKg: 123,
    expectingDeliveryDate: DateTime.now(),
    date: DateTime.now(),
    offeredPriceTenge: 200201,
    reason: '',
    deliveryCompanyId: 4,
    fromLocation: LocationModel(
      name: 'from',
      longitude: 0,
      latitude: 0,
    ),
    toLocation: LocationModel(
      name: 'to',
      longitude: 0,
      latitude: 0,
    ),
  ),
  EventModel(
    id: 5,
    offerId: 1,
    eventTypeId: 6,
    weightKg: 234,
    expectingDeliveryDate: DateTime.now(),
    date: DateTime.now(),
    offeredPriceTenge: 200202,
    reason: '',
    deliveryCompanyId: 5,
    fromLocation: LocationModel(
      name: 'from',
      longitude: 0,
      latitude: 0,
    ),
    toLocation: LocationModel(
      name: 'to',
      longitude: 0,
      latitude: 0,
    ),
  ),
  EventModel(
    id: 6,
    offerId: 1,
    eventTypeId: 7,
    weightKg: 345,
    expectingDeliveryDate: DateTime.now(),
    date: DateTime.now(),
    offeredPriceTenge: 200201,
    reason: '',
    deliveryCompanyId: 6,
    fromLocation: LocationModel(
      name: 'from',
      longitude: 0,
      latitude: 0,
    ),
    toLocation: LocationModel(
      name: 'to',
      longitude: 0,
      latitude: 0,
    ),
  ),
];
