import 'package:faba_weather_app/core/di/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;
@InjectableInit()
Future setupDI(String environment) async =>
    getIt.init(environment: environment);
