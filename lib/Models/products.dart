class Data {
  int id;
  String datetime;
  double lat;
  double lng;
  int speed;
  int heading;
  int altitude;
  int batterylevel;
  double? gpsaccuracy;
  int numberofsatellites;

  Data({
    required this.id,
    required this.datetime,
    required this.lat,
    required this.lng,
    required this.speed,
    required this.heading,
    required this.altitude,
    required this.batterylevel,
    this.gpsaccuracy,
    required this.numberofsatellites,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        datetime: json["DATETIME"],
        lat: json["LAT"]?.toDouble(),
        lng: json["LNG"]?.toDouble(),
        speed: json["SPEED"],
        heading: json["HEADING"],
        altitude: json["ALTITUDE"],
        batterylevel: json["BATTERYLEVEL"],
        gpsaccuracy: json["GPSACCURACY"],
        numberofsatellites: json["NUMBEROFSATELLITES"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "DATETIME": datetime,
        "LAT": lat,
        "LNG": lng,
        "SPEED": speed,
        "HEADING": heading,
        "ALTITUDE": altitude,
        "BATTERYLEVEL": batterylevel,
        "GPSACCURACY": gpsaccuracy,
        "NUMBEROFSATELLITES": numberofsatellites,
      };
}

// ignore: non_constant_identifier_names
Object DataToObject(Data data) => data.toJson();
// ignore: non_constant_identifier_names
List<Data> DataFromJson(List<dynamic> array) =>
    List<Data>.from(array.map((element) => Data.fromJson(element)));

// Data DataFromJson(dynamic json) => Data.fromJson(json);
// Object DataToObject(Data data) => data.toJson();
