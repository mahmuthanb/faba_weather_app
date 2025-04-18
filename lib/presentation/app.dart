import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/presentation/providers/temperature_provider.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/config/theme.dart';
import 'package:faba_weather_app/config/router/app_router.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:faba_weather_app/presentation/providers/language_provider.dart';
import 'package:faba_weather_app/presentation/providers/theme_provider.dart';
import 'package:faba_weather_app/presentation/providers/location_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => TemperatureProvider()),
        ChangeNotifierProvider(create: (context) => getIt<HomeViewModel>()),
        ChangeNotifierProvider(create: (context) => getIt<LocationProvider>()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'FABA Weather App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      locale: context.watch<LanguageProvider>().locale,
      supportedLocales: LanguageProvider.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
