class WeatherModel {
  const WeatherModel({
    required this.temp,
    required this.city,
  });

  final Current temp;

  final Location city;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: Current.fromJson(json['current']),
      city: Location.fromJson(
        json['location'],
      ),
    );
  }
}

class Current {
  final double temp;

  Current({required this.temp});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(temp: json['temp_c'] + 0.0);
  }
  @override
  String toString() => '$temp';
}

class Location {
  final String city;

  Location({required this.city});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['name'],
    );
  }
  @override
  String toString() => city;
}
