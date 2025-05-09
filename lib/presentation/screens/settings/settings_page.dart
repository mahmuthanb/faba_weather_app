import 'package:faba_weather_app/core/constants/app_images.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:faba_weather_app/presentation/providers/language_provider.dart';
import 'package:faba_weather_app/presentation/providers/temperature_provider.dart';
import 'package:faba_weather_app/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final temperatureProvider = context.watch<TemperatureProvider>();
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // FABA Logo
            CircleAvatar(radius: 50, child: Image.asset(AppImages.logo)),
            const SizedBox(height: 16),
            Text(
              l10n.settingsHeader,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            // Settings Section
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: Text(l10n.darkMode),
                    trailing: Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (_) => themeProvider.toggleTheme(),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(l10n.language),
                    trailing: DropdownButton<String>(
                      value: languageProvider.languageCode,
                      items: [
                        DropdownMenuItem(
                          value: 'en',
                          child: Text(l10n.english),
                        ),
                        DropdownMenuItem(
                          value: 'es',
                          child: Text(l10n.spanish),
                        ),
                      ],
                      onChanged: (String? value) {
                        if (value != null) {
                          languageProvider.setLanguage(value);
                        }
                      },
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.thermostat),
                    title: Text(l10n.temperatureUnit),
                    trailing: DropdownButton<String>(
                      value: temperatureProvider.unit,
                      items: [
                        DropdownMenuItem(
                          value: 'metric',
                          child: Text(l10n.celsius),
                        ),
                        DropdownMenuItem(
                          value: 'imperial',
                          child: Text(l10n.fahrenheit),
                        ),
                      ],
                      onChanged: (String? value) {
                        if (value != null) {
                          temperatureProvider.setUnit(value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Additional Settings
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.library_books),
                    title: Text(l10n.licenses),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => showLicensePage(context: context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
