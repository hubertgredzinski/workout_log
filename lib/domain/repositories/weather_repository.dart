import '../models/weather_model.dart';

class WeatherRepository {
  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    return const WeatherModel(city: 'Warsaw', temperature: -5.5);
  }
}
