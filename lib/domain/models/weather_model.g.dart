// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherModel _$$_WeatherModelFromJson(Map<String, dynamic> json) =>
    _$_WeatherModel(
      Current.fromJson(json['current'] as Map<String, dynamic>),
      Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WeatherModelToJson(_$_WeatherModel instance) =>
    <String, dynamic>{
      'current': instance.current,
      'location': instance.location,
    };

_$_Current _$$_CurrentFromJson(Map<String, dynamic> json) => _$_Current(
      (json['temp_c'] as num).toDouble(),
      (json['wind_mph'] as num).toDouble(),
      (json['pressure_mb'] as num).toDouble(),
      json['humidity'] as int,
      json['cloud'] as int,
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CurrentToJson(_$_Current instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'wind_mph': instance.windMph,
      'pressure_mb': instance.pressureMb,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'condition': instance.condition,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      json['name'] as String,
      json['country'] as String,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
    };

_$_Condition _$$_ConditionFromJson(Map<String, dynamic> json) => _$_Condition(
      json['text'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$$_ConditionToJson(_$_Condition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
    };
