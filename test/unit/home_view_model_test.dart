import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';
import 'package:faba_weather_app/domain/usecases/get_current_weather_usecase.dart';
import 'package:faba_weather_app/domain/usecases/get_current_weather_by_location.dart';
import 'package:faba_weather_app/domain/usecases/get_three_hours_weather_usecase.dart';
import 'package:faba_weather_app/data/services/storage_service.dart';
import '../di/test_config.dart';
import '../mocks/mock_storage_service.dart';

void main() {
  late HomeViewModel viewModel;
  late TestApiService testApiService;
  late TestWeatherRepository testWeatherRepository;
  late TestLocationService testLocationService;

  setUp(() async {
    // Set up SharedPreferences for testing
    SharedPreferences.setMockInitialValues({
      'temperature_unit': 'metric',
      'theme_mode': false,
      'app_language': 'en',
    });

    // Initialize SharedPreferences
    await SharedPreferences.getInstance();

    // Initialize StorageService
    await StorageService.init();

    // Set up mock values
    mockTemperatureUnit = 'metric';

    testApiService = TestApiService();
    testWeatherRepository = TestWeatherRepository(apiService: testApiService);
    testLocationService = TestLocationService();

    viewModel = HomeViewModel(
      GetCurrentWeatherUseCase(testWeatherRepository),
      GetCurrentWeatherByLocationUseCase(testWeatherRepository),
      GetThreeHoursWeatherUseCase(testWeatherRepository),
      testLocationService,
    );
  });

  test('getCurrentWeather updates weather state correctly', () async {
    // Arrange
    const cityName = 'London';

    // Wait for initializeLocation to complete
    await Future.delayed(const Duration(milliseconds: 100));

    // Act
    await viewModel.getCurrentWeather(cityName);

    // Assert
    expect(viewModel.weather, isNotNull);
    expect(viewModel.state.error, isNull);
    expect(viewModel.state.isLoading, isFalse);
  });
}
