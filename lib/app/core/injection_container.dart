import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:workout_log/app/core/injection_container.config.dart';

import 'config.dart';

@injectable
final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => Config.baseUrl;
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(
        BaseOptions(baseUrl: url),
      );
}
