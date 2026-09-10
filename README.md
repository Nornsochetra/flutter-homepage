# Flutter Homepage

A static online groceries home screen built with Flutter. The project targets web, Android, and iOS.

## Requirements

- Flutter SDK (stable channel)
- Git, if cloning the repository
- Chrome for web preview
- Android Studio and an Android emulator or device for Android
- macOS and Xcode for iOS development

Check the installation with:

```bash
flutter doctor
```

## Get the project

Clone from Git:

```bash
git clone <repository-url>
cd flutter-homepage
```

Or extract the ZIP file and open a terminal in the extracted `flutter-homepage` folder. The folder must contain `pubspec.yaml`.

## Install dependencies

```bash
flutter pub get
```

Keep these asset folders when moving the project:

```text
assets/images/
assets/products/
assets/categories/
assets/logo/
assets/fonts/
```

## Run the app

For Chrome:

```bash
flutter run -d chrome
```

For Android, start an emulator or connect a device:

```bash
flutter devices
flutter run -d android
```

iOS requires macOS with Xcode. On a Mac:

```bash
open -a Simulator
flutter run -d ios
```

## Build for web

```bash
flutter build web
```

Release files are generated in `build/web/`.

## Project structure

```text
lib/
├── main.dart
├── models/       # Data models
├── screens/      # Full app screens
├── widgets/      # Reusable UI widgets
└── utils/        # Colors and shared constants
```

## Useful commands

```bash
flutter analyze
flutter test
dart format lib
```

If `flutter` is not recognized in PowerShell, restart the terminal after adding the Flutter SDK `bin` folder to PATH.
