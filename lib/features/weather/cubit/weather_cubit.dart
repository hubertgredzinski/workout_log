import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../app/core/enums/enums.dart';
import '../../../domain/models/weather_model.dart';
import '../../../domain/repositories/weather_repository.dart';
part 'weather_state.dart';
part 'weather_cubit.freezed.dart';
@injectable
class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._weatherRepository) : super(WeatherState());

  final WeatherRepository _weatherRepository;

  Future<void> getWeatherModel({
    required String city,
  }) async {
    emit(WeatherState(status: Status.loading));
    try {
      final weatherModel = await _weatherRepository.getWeatherModel(city: city);
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
