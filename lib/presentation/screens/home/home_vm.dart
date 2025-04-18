import 'package:faba_weather_app/data/services/storage_service.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/usecases/get_current_weather_usecase.dart';
import 'package:faba_weather_app/presentation/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  Weather? _weather;
  Weather? get weather => _weather;

  HomeViewModel(this._getCurrentWeatherUseCase);

  Future<void> getCurrentWeather(String cityName) async {
    await handleAsync(() async {
      _weather = await _getCurrentWeatherUseCase.call(
        cityName: cityName,
        units: StorageService.getTemperatureUnit(),
      );
      notifyListeners();
    });
  }
}
