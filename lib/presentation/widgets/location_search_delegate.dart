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
    if (query.isEmpty) {
      return const Center(
        child: Text(
          'Please enter a city name',
          style: TextStyle(color: Colors.white),
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
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        return const Center(
          child: Text(
            'Weather updated!',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text(
          'Start typing to search for a city',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    // Here you could implement city suggestions based on the query
    // For now, we'll just show a message
    return Center(
      child: Text(
        'Searching for: $query',
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
