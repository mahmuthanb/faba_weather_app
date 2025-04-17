import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:faba_weather_app/config/router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () => context.push(AppRoutes.settings),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
