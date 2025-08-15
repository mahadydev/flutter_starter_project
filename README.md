# 🚀 Flutter Starter Project

A **production-ready, scalable, and maintainable Flutter starter template** for rapid development, best practices, and clean architecture. Ideal for teams and individuals who want to kickstart Flutter projects with confidence and consistency.

---

## 📚 Table of Contents

- [✨ Project Intent](#-project-intent)
- [🛠️ Technology Stack](#-technology-stack)
- [🚦 Getting Started](#-getting-started)
- [🔥 Firebase Setup](#-firebase-setup)
- [🖼️ Native Splash Screen](#-native-splash-screen)
- [⚡ Usage Examples](#-usage-examples)
- [🎨 Theme Management](#-theme-management)
- [💾 Storage](#-storage)
- [🌐 Networking](#-networking)
- [🌍 Localization](#-localization)
- [🧪 Testing](#-testing)
- [📈 Analytics & Monitoring](#-analytics--monitoring)
- [🔗 Useful Commands](#-useful-commands)
- [📘 Additional Notes](#-additional-notes)
- [Rebranding](#rebranding)
- [📂 Folder Structure](#-folder-structure)
- [🏗️ Architecture](#-architecture)

---

## ✨ Project Intent

- **Accelerate project setup** with a robust, ready-to-use foundation.
- **Promote best practices** via a clean, modular, feature-first architecture.
- **Ensure consistency** across projects and teams.
- **Integrate essential tooling** (localization, networking, storage, analytics, error reporting, theming, etc.) out of the box.
- **Support scalability** for both small and large codebases.

---

## 🛠️ Technology Stack

- **State Management**: Bloc/Cubit
- **Dependency Injection**: get_it
- **Networking**: Dio, Retrofit, Pretty Dio Logger
- **Local Storage**: SharedPreferences, Drift (SQLite)
- **Secure Storage**: flutter_secure_storage
- **Localization**: Flutter's built-in localization, ARB files, l10n tool
- **Theming**: Material 3, Google Fonts
- **Environment Variables**: flutter_dotenv
- **Firebase**: Analytics, Crashlytics, Messaging
- **Splash Screen**: flutter_native_splash
- **Testing**: Unit, widget, and integration tests

---

## 🚦 Getting Started

### Prerequisites

- Flutter SDK (3.35.1+)
- Dart (3.9.0+)

### Installation

Clone the repository and set up dependencies:

```sh
git clone https://github.com/mahadydev/flutter_starter_project.git
cd flutter_starter_app
flutter pub get
```

Set up environment variables:

```sh
cp .env.example .env # Edit .env and fill in your keys
```

Generate code and assets:

```sh
dart run build_runner build --delete-conflicting-outputs
flutter pub run flutter_native_splash:create
```

Run the app:

```sh
flutter run
```

> For Firebase setup and additional configuration, see the [Firebase Setup](#-firebase-setup) section below.

---

## 🔥 Firebase Setup

1. **Create a Firebase Project** in [Firebase Console](https://console.firebase.google.com/).
2. **Register your app** and download `google-services.json` (Android) and/or `GoogleService-Info.plist` (iOS).
3. **Place files** in:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
4. **Generate `firebase_options.dart`**:
   ```sh
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
5. **Run the app**.

See [FlutterFire documentation](https://firebase.flutter.dev/docs/overview/) for more.

---

## 🖼️ Native Splash Screen

Customize splash in `pubspec.yaml` under `flutter_native_splash`.  
After editing, run:

```sh
flutter pub run flutter_native_splash:create
```

See [flutter_native_splash documentation](https://pub.dev/packages/flutter_native_splash) for options.

---

## ⚡ Usage Examples

### Accessing Injected Services

```dart
final simpleStorage = serviceLocator<SimpleStorageService>();
final secureStorage = serviceLocator<SecureStorageService>();
final themeCubit = serviceLocator<ThemeCubit>();
final apiClient = serviceLocator<RestApiClient>();
```

### Simple Storage

```dart
await simpleStorage.setString('username', 'mahady');
final username = await simpleStorage.getString('username');
await simpleStorage.remove('username');
final exists = await simpleStorage.containsKey('username');
```

### Secure Storage

```dart
await secureStorage.setString('access_token', 'your_token');
final token = await secureStorage.getString('access_token');
await secureStorage.remove('access_token');
```

### Drift Database

```dart
final db = serviceLocator<AppDatabase>();
final item = ExampleItemsCompanion.insert(name: 'Item 1', value: 42);
await db.exampleItemsDao.insertItem(item);
final items = await db.exampleItemsDao.getAllItems();
```

### Theme Switching

```dart
serviceLocator<ThemeCubit>().switchTheme(ThemeMode.dark);
// Or in a widget:
context.read<ThemeCubit>().switchTheme(ThemeMode.light);
```

### Localization & Language Switching

```dart
context.read<LanguageCubit>().switchLanguage(Locale('fr'));
```

---

## 🎨 Theme Management

- Define theme data in `lib/app/theme/`.
- Use `ThemeCubit` for dynamic theme switching and persistence.

---

## 💾 Storage

- **Local**: `SimpleStorageService` (SharedPreferences)
- **Secure**: `SecureStorageService` (flutter_secure_storage)

---

## 🌐 Networking (Dio & Retrofit)

- **Dio** is used as the core HTTP client for all API requests.
- **Retrofit** provides a type-safe, annotation-based API interface for networking.
- All API endpoints are defined in `lib/core/network/rest_api_client.dart`.
- The base URL and other API environment variables are managed via `.env` and loaded using `flutter_dotenv`.

### Example Usage

```dart
import 'package:starter_app/app/di/injection.dart';
import 'package:starter_app/core/network/rest_api_client.dart';

final apiClient = serviceLocator<RestApiClient>();

// Example: Call an endpoint (define your endpoints in RestApiClient)
final response = await apiClient.getSomeData();
```

- Interceptors (e.g., logging, error handling) are configured in `lib/core/network/dio_module.dart`.
- Update or add endpoints in `RestApiClient` as needed for your backend.

---

## 🌍 Localization

- Place `.arb` files in `lib/app/language/arb/` (e.g., `app_fr.arb`).
- Supported locales in `AppLocalizations.supportedLocales`.
- Generate localization code with `flutter gen-l10n`.
- Language is persisted with `SimpleStorageService` and loaded on startup.
- Use `LanguageCubit` for runtime switching and persistence.

**Add a Language:**
1. Add `.arb` file in `lib/app/language/arb/`.
2. Run `flutter pub get`.
3. (iOS) Add the language in Xcode under "Localizations".

---

## 🧪 Testing

- Place unit, widget, and integration tests in `test/`.
- Use mocks and helpers for isolated testing.

---

## 📈 Analytics & Monitoring

- Integrated with Firebase Analytics and Crashlytics.
- Custom logging via `LoggerUtil`.

---

## 🔗 Useful Commands

```sh
# Code generation (models, DI, etc.)
dart run build_runner build --delete-conflicting-outputs
# Watch for changes
dart run build_runner watch --delete-conflicting-outputs
```

---

## 📘 Additional Notes

- **Language Persistence**: User's language choice is saved and restored automatically.
- **Generated Files**: Do not edit files in `lib/app/generated/` manually.
- **State Management**: Uses Cubit/Bloc for predictable, testable state.
- **Networking**: All API calls via `RestApiClient` using Dio and Retrofit.
- **Extensibility**: Add new features in `features/` following clean architecture.

---

## Rebranding

See [REBRANDING.md](./REBRANDING.md) for instructions on changing app name, package name, etc.

---

## 📂 Folder Structure

For a detailed folder structure and architectural philosophy, see [architecture.md](./architecture.md).

---

## 🏗️ Architecture

This project follows a feature-first, clean architecture for scalability and maintainability. For in-depth details, best practices, and extension strategies, refer to [architecture.md](./architecture.md).