import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';

class LocationSearchDelegate extends SearchDelegate {
  final HomeViewModel viewModel;

  LocationSearchDelegate(this.viewModel);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (query.isEmpty) {
      return Center(
        child: Text(
          l10n.enterCityName,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return FutureBuilder(
      future: viewModel.getCurrentWeather(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              '${l10n.error}${snapshot.error}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        return Center(
          child: Text(
            l10n.weatherUpdated,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (query.isEmpty) {
      return Center(
        child: Text(
          l10n.enterCityName,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return Center(
      child: Text(
        l10n.searchingFor(query),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black54,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white70),
        border: InputBorder.none,
      ),
    );
  }
}
