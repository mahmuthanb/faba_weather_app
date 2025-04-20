import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:faba_weather_app/presentation/screens/home/home_page.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';
import 'package:faba_weather_app/domain/usecases/get_current_weather_usecase.dart';
import 'package:faba_weather_app/domain/usecases/get_current_weather_by_location.dart';
import 'package:faba_weather_app/domain/usecases/get_three_hours_weather_usecase.dart';
import 'package:faba_weather_app/presentation/widgets/city_info_card.dart';
import 'package:faba_weather_app/presentation/widgets/main_temperature_display_container.dart';
import 'package:faba_weather_app/presentation/widgets/todays_forecasts_carousel.dart';
import 'package:faba_weather_app/presentation/widgets/weather_forecast_list.dart';
import '../../../mocks/mock_theme_provider.dart';
import '../../../di/test_config.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  late HomeViewModel viewModel;
  late TestApiService testApiService;
  late TestWeatherRepository testWeatherRepository;
  late TestLocationService testLocationService;
  late MockThemeProvider themeProvider;

  setUp(() {
    testApiService = TestApiService();
    testWeatherRepository = TestWeatherRepository(apiService: testApiService);
    testLocationService = TestLocationService();
    themeProvider = MockThemeProvider();
  });

  Widget createTestWidget() {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en')],
      locale: const Locale('en'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>.value(value: viewModel),
          ChangeNotifierProvider<ChangeNotifier>.value(value: themeProvider),
        ],
        child: const HomePage(),
      ),
    );
  }

  testWidgets('HomePage shows loading text initially', (tester) async {
    // Initialize view model before building widget
    viewModel = HomeViewModel(
      GetCurrentWeatherUseCase(testWeatherRepository),
      GetCurrentWeatherByLocationUseCase(testWeatherRepository),
      GetThreeHoursWeatherUseCase(testWeatherRepository),
      testLocationService,
    );

    await tester.pumpWidget(createTestWidget());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.textContaining('Loading', findRichText: true), findsOneWidget);
  });

}
