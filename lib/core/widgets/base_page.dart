import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/widgets/widgets.dart'
    show ErrorMessageWidget, LoadingWidget;

abstract class BasePage extends StatefulWidget {
  const BasePage({super.key});
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  void setLoading(bool value) {
    if (mounted) {
      setState(() {
        _isLoading = value;
      });
    }
  }

  void setError(String? value) {
    if (mounted) {
      setState(() {
        _error = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBody(context),
          if (_isLoading) const LoadingWidget(),
          if (_error != null)
            ErrorMessageWidget(
              message: _error!,
              onDismiss: () => setError(null),
            ),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context);
}
