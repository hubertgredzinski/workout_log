import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workout_log/data/weather_remote_data_source.dart';
import 'package:workout_log/domain/models/weather_model.dart';
import 'package:workout_log/domain/repositories/weather_repository.dart';

class MockWeatherDataSource extends Mock
    implements WeatherRetrofitRemoteDataSource {}

void main() {
  late WeatherRepository sut;
  late MockWeatherDataSource weatherDataSource;

  setUp(() {
    weatherDataSource = MockWeatherDataSource();
    sut = WeatherRepository(weatherRemoteDataSource: weatherDataSource);
  });

  group('getWeatherModel', () {
    test('should call weatherRemoteDataSource.getWeatherModel method',
        () async {
      //1
      when(
        () => weatherDataSource.getWeatherRemoteDataSource(
          city: 'Wroclaw',
        ),
      ).thenAnswer((_) async => null);
      //2
      await sut.getWeatherModel(city: 'Wroclaw');
      //3
      verify(
        () => weatherDataSource.getWeatherRemoteDataSource(
          city: 'Wroclaw',
        ),
      ).called(1);
    });
  });

  group('getWeatherModel', () {
    test('should getWeatherModel method give us correct data from model',
        () async {
      //1
      when(
        () => weatherDataSource.getWeatherRemoteDataSource(
          city: 'Wroclaw',
        ),
      ).thenAnswer(
        (_) async => WeatherModel(
          Current(
            10,
            10,
            10,
            10,
            10,
            Condition(
              'sunny',
            ),
          ),
          Location(
            'Wroclaw',
            'Poland',
          ),
        ),
      );
      //2
      final results = await sut.getWeatherModel(
        city: 'Wroclaw',
      );
      //3,
      expect(
        results,
        WeatherModel(
          Current(
            10,
            10,
            10,
            10,
            10,
            Condition('sunny'),
          ),
          Location(
            'Wroclaw',
            'Poland',
          ),
        ),
      );
    });
  });
}
