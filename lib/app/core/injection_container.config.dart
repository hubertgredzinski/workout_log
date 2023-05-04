// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:workout_log/app/core/injection_container.dart' as _i13;
import 'package:workout_log/data/weather_remote_data_source.dart' as _i10;
import 'package:workout_log/domain/repositories/cardio_history_repository.dart'
    as _i3;
import 'package:workout_log/domain/repositories/strength_history_repository.dart'
    as _i4;
import 'package:workout_log/domain/repositories/weather_repository.dart'
    as _i11;
import 'package:workout_log/features/add_cardio_training/cubit/add_cardio_training_cubit.dart'
    as _i5;
import 'package:workout_log/features/add_strength%20training/cubit/add_strength_training_cubit.dart'
    as _i6;
import 'package:workout_log/features/history_training/_strength_history/cubit/strength_history_cubit.dart'
    as _i9;
import 'package:workout_log/features/history_training/cardio_history/cubit/cardio_history_cubit.dart'
    as _i7;
import 'package:workout_log/features/weather/cubit/weather_cubit.dart' as _i12;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.CardioRepository>(() => _i3.CardioRepository());
    gh.factory<_i4.StrengthRepository>(() => _i4.StrengthRepository());
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i5.AddCardioTrainingCubit>(
        () => _i5.AddCardioTrainingCubit(gh<_i3.CardioRepository>()));
    gh.factory<_i6.AddStrengthTrainingCubit>(
        () => _i6.AddStrengthTrainingCubit(gh<_i4.StrengthRepository>()));
    gh.factory<_i7.CardioHistoryCubit>(
        () => _i7.CardioHistoryCubit(gh<_i3.CardioRepository>()));
    gh.lazySingleton<_i8.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i9.StrengthHistoryCubit>(() => _i9.StrengthHistoryCubit(
        strengthRepository: gh<_i4.StrengthRepository>()));
    gh.factory<_i10.WeatherRetrofitRemoteDataSource>(
        () => _i10.WeatherRetrofitRemoteDataSource(gh<_i8.Dio>()));
    gh.factory<_i11.WeatherRepository>(() => _i11.WeatherRepository(
        weatherRemoteDataSource: gh<_i10.WeatherRetrofitRemoteDataSource>()));
    gh.factory<_i12.WeatherCubit>(() =>
        _i12.WeatherCubit(weatherRepository: gh<_i11.WeatherRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i13.RegisterModule {}
