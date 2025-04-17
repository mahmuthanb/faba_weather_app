import 'package:flutter/material.dart';
import 'package:faba_weather_app/config/theme.dart';
import 'package:faba_weather_app/config/router/app_router.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:faba_weather_app/data/services/storage_services.dart';
import 'package:faba_weather_app/presentation/providers/language_provider.dart';
import 'package:faba_weather_app/presentation/providers/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      ],
    );
  }
}
