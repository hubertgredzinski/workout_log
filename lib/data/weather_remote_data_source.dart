import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../domain/models/weather_model.dart';
part 'weather_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class WeatherRetrofitRemoteDataSource {
  @factoryMethod
  factory WeatherRetrofitRemoteDataSource(
    Dio dio,
  ) = _WeatherRetrofitRemoteDataSource;

  @GET("/current.json?key=c7f5e7160a0a4f7291281603223006&q=/{city}&aqi=no")
  Future<WeatherModel?> getWeatherRemoteDataSource(
      {@Path(
        "city",
      )
          required String city});
}
