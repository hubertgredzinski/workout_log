import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:workout_log/app/core/enums/enums.dart';
import 'package:workout_log/domain/models/repositories/weather_repository.dart';
import 'package:workout_log/domain/models/weather_model.dart';
import 'package:workout_log/features/weather/cubit/weather_cubit.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late WeatherCubit sut;
  late MockWeatherRepository repository;

  setUp(
    () {
      repository = MockWeatherRepository();
      sut = WeatherCubit(weatherRepository: repository);
    },
  );
  group(
    'start',
    () {
      group(
        'success',
        () {
          setUp(
            () {
              //1
              when(
                () => repository.getWeatherModel(city: 'Wroclaw'),
              ).thenAnswer(
                (_) async => WeatherModel(
                  Current(10),
                  Location('Wroclaw', 'Poland'),
                  Location('Wroclaw', 'Poland'),
                ),
              );
            },
          );
//2
          blocTest<WeatherCubit, WeatherState>(
            'emits Status.loading then Status.success with results',
            build: () => sut,
            act: (cubit) => cubit.start(city: 'Wroclaw'),
            //3
            expect: () => [
              WeatherState(status: Status.loading),
              WeatherState(
                model: WeatherModel(
                  Current(10),
                  Location(
                    'Wroclaw',
                    'Poland',
                  ),
                  Location(
                    'Wroclaw',
                    'Poland',
                  ),
                ),
                status: Status.success,
              ),
            ],
          );
        },
      );

      group(
        'failure',
        () {
          setUp(
            () {
              //1
              when(() => repository.getWeatherModel(city: 'Wroclaw')).thenThrow(
                Exception('test-exception-error'),
              );
            },
          );
//2
          blocTest<WeatherCubit, WeatherState>(
            'emits Status.loading then Status.error with error message',
            build: () => sut,
            act: (cubit) => cubit.start(city: 'Wroclaw'),
            //3
            expect: () => [
              WeatherState(status: Status.loading),
              WeatherState(
                errorMessage: 'Exception: test-exception-error',
                status: Status.error,
              ),
            ],
          );
        },
      );
    },
  );
}
