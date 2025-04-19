import 'package:faba_weather_app/core/services/location_service.dart';
import 'package:faba_weather_app/data/services/storage_service.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/usecases/get_current_weather_usecase.dart';
import 'package:faba_weather_app/domain/usecases/get_seven_days_weather_usecase.dart';
import 'package:faba_weather_app/presentation/base/base_view_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  final GetSevenDaysWeatherUseCase _getSevenDaysWeatherUseCase;
  final LocationService _locationService;
  Weather? _weather;
  Weather? get weather => _weather;
  List<Weather>? _sevenDaysWeather;
  List<Weather>? get sevenDaysWeather => _sevenDaysWeather;
  Position? _location;
  Position? get location => _location;

  HomeViewModel(
    this._getCurrentWeatherUseCase,
    this._getSevenDaysWeatherUseCase,
    this._locationService,
  ) {
    initializeLocation();
  }

  Future<void> getCurrentWeather(String cityName) async {
    _weather = await _getCurrentWeatherUseCase.call(
      cityName: cityName,
      units: StorageService.getTemperatureUnit(),
    );
    notifyListeners();
  }

  Future<void> getCurrentWeatherByLocation() async {
    _sevenDaysWeather = await _getSevenDaysWeatherUseCase.call(
      latitude: _location?.latitude.toString() ?? "",
      longitude: _location?.longitude.toString() ?? "",
      exclude: "current,minutely,hourly",
    );
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    _location = await _locationService.getCurrentLocation();
    notifyListeners();
  }

  Future<void> initializeLocation() async {
    try {
      setLoading(true);
      await getCurrentLocation();
      if (location != null) {
        await getCurrentWeather("Konya");
      }
    } catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
