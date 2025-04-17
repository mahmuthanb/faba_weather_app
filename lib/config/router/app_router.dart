import 'package:go_router/go_router.dart';
import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/presentation/settings/settings_page.dart';
import 'package:faba_weather_app/presentation/home/home_page.dart';

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
  ],
);
