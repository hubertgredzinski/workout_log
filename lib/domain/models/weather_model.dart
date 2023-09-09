import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel(Current current, Location location) = _WeatherModel;

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      WeatherModel(
        Current.fromJson(json["current"]),
        Location.fromJson(json["location"]),
      );
}

@freezed
class Current with _$Current {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory Current(
    double tempC,
    double windMph,
    double pressureMb,
    int humidity,
    int cloud,
    Condition condition,
  ) = _Current;

  factory Current.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CurrentFromJson(json);
}

@freezed
class Location with _$Location {
  factory Location(
    String name,
    String country,
  ) = _Location;

  factory Location.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LocationFromJson(json);
}

@freezed
class Condition with _$Condition {
  factory Condition(
    String text,
  ) = _Condition;

  factory Condition.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ConditionFromJson(json);
}
