class GooglePlaceDetailsModel {
  Result? result;
  String? status;

  GooglePlaceDetailsModel({
    this.result,
    this.status,
  });

  GooglePlaceDetailsModel copyWith({
    Result? result,
    String? status,
  }) =>
      GooglePlaceDetailsModel(
        result: result ?? this.result,
        status: status ?? this.status,
      );

  factory GooglePlaceDetailsModel.fromJson(Map<String, dynamic> json) => GooglePlaceDetailsModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "status": status,
      };
}

class Result {
  List<AddressComponent>? addressComponents;
  Geometry? geometry;

  Result({
    this.addressComponents,
    this.geometry,
  });

  Result copyWith({
    List<AddressComponent>? addressComponents,
    Geometry? geometry,
  }) =>
      Result(
        addressComponents: addressComponents ?? this.addressComponents,
        geometry: geometry ?? this.geometry,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: json["address_components"] == null ? [] : List<AddressComponent>.from(json["address_components"]!.map((x) => AddressComponent.fromJson(x))),
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "address_components": addressComponents == null ? [] : List<dynamic>.from(addressComponents!.map((x) => x.toJson())),
        "geometry": geometry?.toJson(),
      };
}

class AddressComponent {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  AddressComponent copyWith({
    String? longName,
    String? shortName,
    List<String>? types,
  }) =>
      AddressComponent(
        longName: longName ?? this.longName,
        shortName: shortName ?? this.shortName,
        types: types ?? this.types,
      );

  factory AddressComponent.fromJson(Map<String, dynamic> json) => AddressComponent(
        longName: json["long_name"],
        shortName: json["short_name"],
        types: json["types"] == null ? [] : List<String>.from(json["types"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "long_name": longName,
        "short_name": shortName,
        "types": types == null ? [] : List<dynamic>.from(types!.map((x) => x)),
      };
}

class Geometry {
  Location? location;

  Geometry({
    this.location,
  });

  Geometry copyWith({
    Location? location,
  }) =>
      Geometry(
        location: location ?? this.location,
      );

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
      };
}

class Location {
  double? lat;
  double? lng;

  Location({
    this.lat,
    this.lng,
  });

  Location copyWith({
    double? lat,
    double? lng,
  }) =>
      Location(
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
