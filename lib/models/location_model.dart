class LocationModel {
  LocationModel({
    required this.name,
    required this.longitude,
    required this.latitude,
  });

  String name;
  int longitude;
  int latitude;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    name: json["name"],
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "longitude": longitude,
    "latitude": latitude,
  };
}

