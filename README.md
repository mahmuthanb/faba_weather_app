# Faba Weather App 🌤️

A beautiful and informative weather application built with Flutter, providing real-time weather information with a modern and intuitive user interface.

## 🌟 Features

- Real-time weather updates
- Location-based weather information
- Detailed weather forecasts
- Beautiful and responsive UI
- Dark/Light theme support
- Multi-language support

## 🏗️ Architecture

The project follows Clean Architecture principles with a clear separation of concerns:

```
lib/
├── config/         # App configuration, themes, routes
├── core/           # Core functionality, utilities, constants
├── data/           # Data layer
│   ├── datasources/    # Remote and local data sources
│   ├── models/         # Data models
│   └── repositories/   # Repository implementations
├── domain/         # Business logic layer
│   ├── entities/       # Business objects
│   ├── repositories/   # Repository interfaces
│   └── usecases/       # Use cases
└── presentation/   # UI layer
    ├── base/          # Base state and viewmodels
    ├── providers/     # Location, language, theme providers
    ├── screens/       # Screen widgets
    └── widgets/       # Reusable widgets
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- iOS development tools (for iOS development)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/mahmuthanb/faba_weather_app.git
cd faba_weather_app
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the following commands to generate necessary files:

```bash
# Generate localization files
flutter gen-l10n

# Generate code files (models, repositories, etc.)
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running the App

#### Debug Mode

```bash
flutter run --dart-define=API_KEY=your_api_key_here
```

#### Release Mode

```bash
flutter run --release --dart-define=API_KEY=your_api_key_here
```

## 🛠️ Development Setup

### VS Code Launch Configuration

Create or update `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "faba_weather_app",
      "request": "launch",
      "type": "dart",
      "args": ["--dart-define=API_KEY=your_api_key_here"]
    },
    {
      "name": "faba_weather_app debug",
      "request": "launch",
      "type": "dart",
      "flutterMode": "debug",
      "args": ["--dart-define=API_KEY=your_api_key_here"]
    }
  ]
}
```

## 📱 Supported Platforms

- iOS
- Android

## 🧪 Testing

Run tests using:

```bash
flutter test
```

## 📦 Dependencies

Key dependencies are listed in `pubspec.yaml`. The app uses:

- `flutter_bloc` for state management
- `dio` for network requests
- `get_it` for dependency injection
- `flutter_dotenv` for environment variables
- And more...

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- Mahmuthan BARISIK ([@mahmuthanb](https://github.com/mahmuthanb))

## 🙏 Acknowledgments

- [OpenWeatherMap](https://openweathermap.org/api) API provider
