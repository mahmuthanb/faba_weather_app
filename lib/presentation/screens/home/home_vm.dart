import 'package:faba_weather_app/core/services/location_service.dart';
import 'package:faba_weather_app/data/services/storage_service.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/usecases/get_current_weather_usecase.dart';
import 'package:faba_weather_app/domain/usecases/get_three_hours_weather_usecase.dart';
import 'package:faba_weather_app/presentation/base/base_view_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  final GetThreeHoursWeatherUseCase _getThreeHoursWeatherUseCase;
  final LocationService _locationService;

  Weather? _weather;
  Weather? get weather => _weather;

  List<Weather>? _threeHoursWeather;
  List<Weather>? get threeHoursWeather => _threeHoursWeather;

  CityInfo? _cityInfo;
  CityInfo? get cityInfo => _cityInfo;

  Position? _location;
  Position? get location => _location;

  HomeViewModel(
    this._getCurrentWeatherUseCase,
    this._getThreeHoursWeatherUseCase,
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
    if (_location == null) return;
    final response = await _getThreeHoursWeatherUseCase.call(
      latitude: _location!.latitude.toString(),
      longitude: _location!.longitude.toString(),
      units: StorageService.getTemperatureUnit(),
    );

    _threeHoursWeather = response.list;
    _cityInfo = response.city;
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    _location = await _locationService.getCurrentLocation();
    notifyListeners();
  }

  Future<void> initializeLocation() async {
    try {
      setLoading(true);
      getCurrentLocation().then((value) async {
        await getCurrentWeather("Konya");
        await getCurrentWeatherByLocation();
      });
    } catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
    }
  }
}
