import 'package:flutter/foundation.dart';
import 'package:faba_weather_app/presentation/base/base_state.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BaseState _state = const BaseState();
  BaseState get state => _state;

  bool get isLoading => _state.isLoading;
  String? get error => _state.error;

  void setLoading(bool loading) {
    _state = _state.copyWith(isLoading: loading, error: null);
    notifyListeners();
  }

  void setError(String error) {
    _state = _state.copyWith(isLoading: false, error: error);
    notifyListeners();
  }

  void clearError() {
    _state = _state.copyWith(error: null);
    notifyListeners();
  }

  Future<T> handleAsync<T>(Future<T> Function() action) async {
    try {
      setLoading(true);
      final result = await action();
      setLoading(false);
      return result;
    } catch (e) {
      setError(e.toString());
      rethrow;
    }
  }
}
