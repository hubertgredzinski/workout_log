import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel(
      @JsonKey(name: 'current') Current temp, // keys sie pojawiają!!!
      @JsonKey(name: 'location') Location city) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Current with _$Current {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory Current(double tempC) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
class Location with _$Location {
  factory Location(String name) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}





// @JsonSerializable(explicitToJson: true)
// class WeatherModel {
//   @JsonKey(name: 'current')
//   final Current temp;
//   @JsonKey(name: 'location')
//   final Location city;
//   WeatherModel({
//     required this.temp,
//     required this.city,
//   });

//   factory WeatherModel.fromJson(Map<String, dynamic> json) =>
//       _$WeatherModelFromJson(json);

//   Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
// }


// @JsonSerializable()
// class Current {
//   @JsonKey(name: 'temp_c')
//   final double temp;

//   Current({required this.temp});

//   factory Current.fromJson(Map<String, dynamic> json) =>
//       _$CurrentFromJson(json);

//   Map<String, dynamic> toJson() => _$CurrentToJson(this);

//   @override
//   String toString() => '$temp';
// }


// @JsonSerializable()
// class Location {
//   final String name;

//   Location({required this.name});

//   factory Location.fromJson(Map<String, dynamic> json) =>
//       _$LocationFromJson(json);

//   Map<String, dynamic> toJson() => _$LocationToJson(this);

//   @override
//   String toString() => name;
// }
