import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel(
    @JsonKey(
      name: 'current',
    )
        Current temp,
    @JsonKey(
      name: 'location',
    )
        Location city,
  ) = _WeatherModel;

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Current with _$Current {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory Current(
    double tempC,
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
  ) = _Location;

  factory Location.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LocationFromJson(json);
}
