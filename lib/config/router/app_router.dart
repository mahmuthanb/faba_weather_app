import 'package:faba_weather_app/presentation/screens/weather_detail/weather_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/presentation/screens/settings/settings_page.dart';
import 'package:faba_weather_app/presentation/screens/home/home_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      name: 'settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: AppRoutes.weatherDetail,
      name: 'weatherDetail',
      builder: (context, state) => const WeatherDetailPage(),
    ),
  ],
);
