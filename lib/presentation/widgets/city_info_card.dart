import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:faba_weather_app/core/utils/time_utils.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';
import 'package:faba_weather_app/presentation/widgets/glassy_container.dart';
import 'package:faba_weather_app/presentation/widgets/shimmer_placeholder.dart';
import 'package:flutter/material.dart';

class CityInfoCard extends StatelessWidget {
  const CityInfoCard({super.key, required this.cityInfo});

  final CityInfo? cityInfo;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * 0.25,
      child:
          cityInfo == null
              ? const ShimmerPlaceholder(isGlassy: true)
              : GlassyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem(
                          Icons.people,
                          l10n.population,
                          cityInfo!.population.toString(),
                        ),
                        _buildInfoItem(
                          Icons.access_time,
                          l10n.timezone,
                          'UTC${cityInfo!.timezone >= 0 ? '+' : ''}${cityInfo!.timezone ~/ 3600}',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem(
                          Icons.wb_sunny,
                          l10n.sunrise,
                          TimeUtils.formatTime(cityInfo!.sunrise),
                        ),
                        _buildInfoItem(
                          Icons.nights_stay,
                          l10n.sunset,
                          TimeUtils.formatTime(cityInfo!.sunset),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
    );
  }
}

Widget _buildInfoItem(IconData icon, String label, String value) {
  return SizedBox(
    width: 100,
    child: Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white.withAlpha(175), fontSize: 12),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
