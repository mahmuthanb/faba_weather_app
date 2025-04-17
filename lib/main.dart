import 'package:faba_weather_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/presentation/app/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FABA Weather App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const App(),
    );
  }
}
