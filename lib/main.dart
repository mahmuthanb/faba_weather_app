import 'package:faba_weather_app/core/bootstrap/bootstrap.dart';
import 'package:faba_weather_app/presentation/app.dart';

Future<void> main() async {
  bootstrap(() => App(), "dev");
}
