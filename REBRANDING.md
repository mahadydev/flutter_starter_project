# 🚀 Rebranding Guide

Easily rebrand this Flutter starter app for your own project (change app name, package name, bundle ID, etc.) using the [`rename`](https://pub.dev/packages/rename) package.

---

## 1. Install the Rename Tool

Install the rename package globally:

```sh
flutter pub global activate rename
```

---

## 2. Choose Your New App Name & Bundle ID

- **App Name:** The display name for your app (e.g., `My Cool App`).
- **Bundle ID:** The unique identifier (e.g., `com.example.mycoolapp`).

---

## 3. Set the App Name

Set the new app name for iOS and Android:

```sh
rename setAppName --targets ios,android --value "My Cool App"
```

---

## 4. Set the Bundle ID

Set the new bundle ID for iOS and Android:

```sh
rename setBundleId --targets ios,android --value "com.example.mycoolapp"
```

---

## 5. Review & Test

- Review your `pubspec.yaml`, `android/app/build.gradle.kts`, and `ios/Runner.xcodeproj/project.pbxproj` for any remaining old names or IDs.
- Run and test your app on both platforms:

```sh
flutter run
```

---

## 6. Tips & Best Practices

- **Backup First:** Use version control or make a backup before running bulk renames.
- **Manual Checks:** Some assets, icons, or config files may need manual updates (e.g., app icons, splash screens, Firebase config).
- **CI/CD:** Update your CI/CD and store listings with the new app name and bundle ID.

---

**Happy coding and rebranding!**
