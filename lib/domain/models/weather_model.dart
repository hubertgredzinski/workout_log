import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel {
  const WeatherModel({
    required this.temp,
    required this.city,
  });
  @JsonKey(name: 'current')
  final Current temp;
  @JsonKey(name: 'location')
  final Location city;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: 'temp_c')
  final double temp;

  Current({required this.temp});

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  @override
  String toString() => '$temp';
}

@JsonSerializable()
class Location {
  final String name;

  Location({required this.name});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  String toString() => name;
}
