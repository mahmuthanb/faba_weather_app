import 'package:faba_weather_app/core/constants/app_images.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:faba_weather_app/presentation/providers/language_provider.dart';
import 'package:faba_weather_app/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
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
              'FABA International Case Study',
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
                    title: Text('Dark Mode'),
                    trailing: Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (_) => themeProvider.toggleTheme(),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: Text('Language'),
                    trailing: DropdownButton<String>(
                      value: languageProvider.languageCode,
                      items: const [
                        DropdownMenuItem(value: 'en', child: Text('English')),
                        DropdownMenuItem(value: 'es', child: Text('Español')),
                      ],
                      onChanged: (String? value) {
                        if (value != null) {
                          languageProvider.setLanguage(value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Additional Settings
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.library_books),
                    title: Text('Licenses'),
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
