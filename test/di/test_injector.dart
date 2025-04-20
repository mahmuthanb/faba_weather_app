import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:faba_weather_app/core/di/locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initTestGetIt',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureTestDependencies() async =>
    getIt.init(environment: Environment.test);
