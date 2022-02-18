import 'package:delivery/models/location_model.dart';

enum eventId {
  orderEvent, //1
  offerEvent, //2
  offerAcceptEvent, //3
  orderCancelEvent, //4
  orderFreightReceiveEvent, //5
  orderFulfillmentEvent, //6
  orderFailEvent, //7
}

class EventModel {
  EventModel({
    required this.id,
    required this.offerId,
    required this.eventTypeId,
    required this.weightKg,
    required this.expectingDeliveryDate,
    required this.date,
    required this.offeredPriceTenge,
    required this.reason,
    required this.deliveryCompanyId,
    required this.fromLocation,
    required this.toLocation,
  });

  int id;
  int offerId;
  int eventTypeId;
  int weightKg;
  DateTime expectingDeliveryDate;
  DateTime date;
  int offeredPriceTenge;
  String reason;
  int deliveryCompanyId;
  LocationModel fromLocation;
  LocationModel toLocation;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        offerId: json["offer_id"],
        eventTypeId: json["event_type_id"],
        weightKg: json["weight_kg"],
        expectingDeliveryDate: DateTime.parse(json["expecting_delivery_date"]),
        date: DateTime.parse(json["date"]),
        offeredPriceTenge: json["offered_price_tenge"],
        reason: json["reason"],
        deliveryCompanyId: json["delivery_company_id"],
        fromLocation: LocationModel.fromJson(json["from_location"]),
        toLocation: LocationModel.fromJson(json["to_location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "offer_id": offerId,
        "event_type_id": eventTypeId,
        "weight_kg": weightKg,
        "expecting_delivery_date":
            "${expectingDeliveryDate.year.toString().padLeft(4, '0')}-${expectingDeliveryDate.month.toString().padLeft(2, '0')}-${expectingDeliveryDate.day.toString().padLeft(2, '0')}",
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "offered_price_tenge": offeredPriceTenge,
        "reason": reason,
        "delivery_company_id": deliveryCompanyId,
        "from_location": fromLocation.toJson(),
        "to_location": toLocation.toJson(),
      };
}

extension EventModelExtension on EventModel {
  copyWith(int eventTypeId) {
    return EventModel(
        id: id,
        offerId: offerId,
        eventTypeId: eventTypeId,
        weightKg: weightKg,
        expectingDeliveryDate: expectingDeliveryDate,
        date: date,
        offeredPriceTenge: offeredPriceTenge,
        reason: reason,
        deliveryCompanyId: deliveryCompanyId,
        fromLocation: fromLocation,
        toLocation: toLocation);
  }
}
