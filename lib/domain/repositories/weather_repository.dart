import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final response = await Dio().get(
        'http://api.weatherapi.com/v1/current.json?key=c7f5e7160a0a4f7291281603223006&q=Wroclaw&aqi=no');
    response.data;
    return const WeatherModel(city: 'Warsaw', temperature: -5.5);
  }
}
