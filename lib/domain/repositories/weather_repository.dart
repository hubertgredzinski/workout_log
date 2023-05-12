import 'package:workout_log/data/weather_remote_data_source.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  WeatherRepository({required this.weatherRemoteDataSource});
  final WeatherRetrofitRemoteDataSource weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    return weatherRemoteDataSource.getWeatherRemoteDataSource(
      city: city,
    );
  }
}
