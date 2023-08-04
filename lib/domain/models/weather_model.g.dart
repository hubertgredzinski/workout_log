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
      'current': instance.temp,
      'location': instance.city,
    };

_$_Current _$$_CurrentFromJson(Map<String, dynamic> json) => _$_Current(
      (json['temp_c'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CurrentToJson(_$_Current instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      json['name'] as String,
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
