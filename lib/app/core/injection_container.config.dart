// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:workout_log/app/core/injection_container.dart' as _i18;
import 'package:workout_log/data/cardio_history_data_source.dart' as _i3;
import 'package:workout_log/data/strength_history_data_source.dart' as _i6;
import 'package:workout_log/data/weather_remote_data_source.dart' as _i15;
import 'package:workout_log/domain/repositories/cardio_history_repository.dart'
    as _i4;
import 'package:workout_log/domain/repositories/notes_repository.dart' as _i5;
import 'package:workout_log/domain/repositories/strength_history_repository.dart'
    as _i7;
import 'package:workout_log/domain/repositories/weather_repository.dart'
    as _i16;
import 'package:workout_log/features/add_cardio_training/cubit/add_cardio_training_cubit.dart'
    as _i8;
import 'package:workout_log/features/add_notes/cubit/add_notes_page_cubit.dart'
    as _i9;
import 'package:workout_log/features/add_strength%20training/cubit/add_strength_training_cubit.dart'
    as _i10;
import 'package:workout_log/features/history/_strength_history/cubit/strength_history_cubit.dart'
    as _i14;
import 'package:workout_log/features/history/cardio_history/cubit/cardio_history_cubit.dart'
    as _i11;
import 'package:workout_log/features/notes/cubit/notes_cubit.dart' as _i13;
import 'package:workout_log/features/weather/cubit/weather_cubit.dart' as _i17;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
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
    gh.factory<_i3.CardioHistoryDataSource>(
        () => _i3.CardioHistoryDataSource());
    gh.factory<_i4.CardioRepository>(() => _i4.CardioRepository(
        cardioDataSource: gh<_i3.CardioHistoryDataSource>()));
    gh.factory<_i5.NotesRepository>(() => _i5.NotesRepository());
    gh.factory<_i6.StrengthHistoryDataSource>(
        () => _i6.StrengthHistoryDataSource());
    gh.factory<_i7.StrengthHistoryRepository>(() =>
        _i7.StrengthHistoryRepository(
            strengthDataSource: gh<_i6.StrengthHistoryDataSource>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i8.AddCardioTrainingCubit>(
        () => _i8.AddCardioTrainingCubit(gh<_i4.CardioRepository>()));
    gh.factory<_i9.AddNotesPageCubit>(
        () => _i9.AddNotesPageCubit(gh<_i5.NotesRepository>()));
    gh.factory<_i10.AddStrengthTrainingCubit>(() =>
        _i10.AddStrengthTrainingCubit(gh<_i7.StrengthHistoryRepository>()));
    gh.factory<_i11.CardioHistoryCubit>(
        () => _i11.CardioHistoryCubit(gh<_i4.CardioRepository>()));
    gh.lazySingleton<_i12.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i13.NotesCubit>(
        () => _i13.NotesCubit(gh<_i5.NotesRepository>()));
    gh.factory<_i14.StrengthHistoryCubit>(() => _i14.StrengthHistoryCubit(
        strengthHistoryRepository: gh<_i7.StrengthHistoryRepository>()));
    gh.factory<_i15.WeatherRetrofitRemoteDataSource>(
        () => _i15.WeatherRetrofitRemoteDataSource(gh<_i12.Dio>()));
    gh.factory<_i16.WeatherRepository>(() => _i16.WeatherRepository(
        weatherRemoteDataSource: gh<_i15.WeatherRetrofitRemoteDataSource>()));
    gh.factory<_i17.WeatherCubit>(() =>
        _i17.WeatherCubit(weatherRepository: gh<_i16.WeatherRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
