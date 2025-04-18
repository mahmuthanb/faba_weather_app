import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:faba_weather_app/config/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final homeViewModel = getIt<HomeViewModel>();
    return Provider<HomeViewModel>(
      create: (context) => homeViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.appTitle),
          actions: [
            IconButton(
              onPressed: () => context.push(AppRoutes.settings),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text("Hello"),
              ElevatedButton(
                onPressed: () => homeViewModel.getCurrentWeather("Konya"),
                child: Text("Get Weather"),
              ),
              Text(homeViewModel.weather.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
