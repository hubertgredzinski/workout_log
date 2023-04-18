import 'package:workout_log/data/weather_remote_data_source.dart';
import '../models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final json =
        await _weatherRemoteDataSource.getWeatherRemoteDataSource(city: city);
    if (json == null) {
      return null;
    }
    return WeatherModel.fromJson(json);
  }
}
