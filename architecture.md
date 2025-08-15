# 🏗️ Flutter Starter Project Architecture

A **feature-first, clean architecture** approach for scalable, maintainable, and testable Flutter apps.

---

## 📂 Folder Structure (Summary)

See the [README.md](./README.md) for a high-level overview and quick start. This file details advanced structure and best practices.

```text
lib/
  app/           # App-level config, DI, routing, theming, localization
  core/          # Shared services, storage, networking, utilities
  features/      # Feature modules (data, domain, presentation)
  firebase_options.dart (if setup)
  main.dart

test/            # Unit, widget, integration, mocks, helpers
```

---

## 🧠 Architectural Philosophy

- **Feature-First Organization**: Each feature is a self-contained module with its own data, domain, and presentation layers.
- **Clean Architecture Layers**: Data (API, DB, cache), Domain (business logic), Presentation (UI, state management).
- **Core Layer**: Shared utilities, services, and widgets used across features.
- **App Layer**: Application-wide configuration: DI, routing, theming, localization, and generated files.

---

## 🛠️ Key Principles

- **Modularity**: Features are isolated and reusable.
- **Testability**: Each layer can be tested independently.
- **Extensibility**: Add new features or swap implementations with minimal impact.
- **Maintainability**: Clear boundaries and responsibilities.
- **Scalability**: Easily add new features or refactor existing ones without breaking the app.

---

## 🧩 Example: Adding a New Feature

Suppose you want to add a "Profile" feature:

```text
features/
  profile/
    data/
      datasources/
      models/
      repositories/
    domain/
      entities/
      repositories/
      usecases/
    presentation/
      screens/
      widgets/
      cubit/
```

---

## 🔄 Data Flow Example

1. **UI** (presentation) triggers an action (e.g., fetch profile).
2. **Cubit/Bloc** calls a **use case** (domain).
3. **Use case** interacts with a **repository** (domain).
4. **Repository** fetches data from **API/DB** (data).
5. Data is returned up the chain and displayed in the UI.

---

## 🌍 Localization & Language Management

- Place `.arb` files in `lib/app/language/arb/` (e.g., `app_fr.arb`).
- Supported locales managed in `AppLocalizations.supportedLocales`.
- Run `flutter gen-l10n` to generate localization code.
- Use `LanguageCubit` for runtime switching and persistence.

---

## 🧪 Testing Strategy

- **Unit Tests**: For business logic (use cases, Cubits, repositories).
- **Widget Tests**: For UI components.
- **Integration Tests**: For end-to-end flows.
- **Mocks/Helpers**: Place in `test/mocks/` and `test/helpers/`.

---

## 🧰 Core Services & Utilities

- **Dependency Injection**: `GetIt` via `app/di/injection.dart`.
- **Networking**: `Dio` + `Retrofit` with interceptors and logging.
- **Local Storage**: `SimpleStorageService` (SharedPreferences), `SecureStorageService` (flutter_secure_storage).
- **Database**: Drift (SQLite) for relational/offline data.
- **Firebase**: Analytics, Crashlytics, Messaging.
- **Logging**: `LoggerUtil` for structured logs.
- **Snackbar/Toast**: `SnackbarUtil` for user feedback.

---

## 🧩 Extending the App

- Add new features by creating a new folder in `features/` and following the clean architecture pattern.
- Add new translations by creating `.arb` files and running `flutter gen-l10n`.
- Add new services/utilities in `core/` as needed.

---

> For general usage, quick start, and more, see the [README.md](./README.md). For code-level details, see inline comments in the codebase.