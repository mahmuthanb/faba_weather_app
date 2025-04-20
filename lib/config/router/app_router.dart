import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/presentation/screens/weather_detail/weather_detail_page.dart';
import 'package:flutter/material.dart';
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
      pageBuilder:
          (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const SettingsPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
    ),
    GoRoute(
      path: AppRoutes.weatherDetail,
      name: 'weatherDetail',
      pageBuilder:
          (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: WeatherDetailPage(weather: state.extra as Weather),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
    ),
  ],
);
