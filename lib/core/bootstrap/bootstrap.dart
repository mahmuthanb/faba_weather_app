import 'dart:async';
import 'dart:developer';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/core/logger/logger.dart';
import 'package:faba_weather_app/data/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, String env) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await StorageService.init();
      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
        FlutterError.dumpErrorToConsole(details);
      };
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      await setupDI(env);
      runApp(await builder());
    },
    (error, stackTrace) {
      Log.e(error.toString(), tag: "Zone Error");
      Log.e(stackTrace.toString(), tag: "Zone StackTrace");
    },
  );
}
