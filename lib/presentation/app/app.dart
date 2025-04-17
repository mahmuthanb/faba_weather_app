import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FABA Weather App')),
      body: Center(child: Text('Hello, World!')),
    );
  }
}
