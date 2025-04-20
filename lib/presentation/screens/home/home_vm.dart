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

  List<Weather>? _fiveDayForecast;
  List<Weather>? get fiveDayForecast => _fiveDayForecast;

  List<Weather>? _todayForecast;
  List<Weather>? get todayForecast => _todayForecast;

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
    _processFiveDayForecast();
    _processTodayForecast();
    notifyListeners();
  }

  void _processFiveDayForecast() {
    if (_threeHoursWeather == null) return;

    final now = DateTime.now();
    final fiveDayForecast = <Weather>[];
    final processedDates = <String>{};

    for (var weather in _threeHoursWeather!) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(
        weather.timestamp * 1000,
      );
      final dateKey = '${dateTime.year}-${dateTime.month}-${dateTime.day}';

      // Skip if we've already processed this date or if it's today
      if (processedDates.contains(dateKey) ||
          (dateTime.year == now.year &&
              dateTime.month == now.month &&
              dateTime.day == now.day)) {
        continue;
      }

      // Only include forecasts at 12:00 PM (noon)
      if (dateTime.hour == 12) {
        fiveDayForecast.add(weather);
        processedDates.add(dateKey);
      }

      // Stop after getting 5 days
      if (fiveDayForecast.length >= 5) {
        break;
      }
    }

    _fiveDayForecast = fiveDayForecast;
  }

  void _processTodayForecast() {
    if (_threeHoursWeather == null) return;

    final now = DateTime.now();
    final todayForecast = <Weather>[];

    for (var weather in _threeHoursWeather!) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(
        weather.timestamp * 1000,
      );

      // Only include today's forecasts
      if (dateTime.year == now.year &&
          dateTime.month == now.month &&
          dateTime.day == now.day) {
        todayForecast.add(weather);
      }
    }

    _todayForecast = todayForecast;
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
