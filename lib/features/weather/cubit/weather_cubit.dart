import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../app/core/enums/enums.dart';
import '../../../domain/models/repositories/weather_repository.dart';
import '../../../domain/models/weather_model.dart';
part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required this.weatherRepository,
  }) : super(WeatherState());

  final WeatherRepository weatherRepository;

  Future<void> start({
    required String city,
  }) async {
    emit(
      WeatherState(
        status: Status.loading,
      ),
    );
    try {
      final weatherModel = await weatherRepository.getWeatherModel(
        city: city,
      );
      emit(
        WeatherState(
          model: weatherModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        WeatherState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
