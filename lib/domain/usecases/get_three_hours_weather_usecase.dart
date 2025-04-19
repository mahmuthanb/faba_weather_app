import 'package:faba_weather_app/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';

@injectable
class GetThreeHoursWeatherUseCase {
  final WeatherRepository _repository;

  GetThreeHoursWeatherUseCase(this._repository);

  Future<ForecastResponseModel> call({
    required String latitude,
    required String longitude,
    required String units,
  }) async {
    return await _repository.getThreeHoursWeather(
      latitude: latitude,
      longitude: longitude,
      units: units,
    );
  }
}
