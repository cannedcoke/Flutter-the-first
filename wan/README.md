# wan

A motivational mobile app built with Flutter as a first project. It features a rotating image slideshow, inspirational phrases, and a persistent to-do list.

## Screens

**Home**
The landing screen with a welcome message, an auto-cycling image slideshow, and two navigation buttons to switch between the Inspiration and Tareas screens.

**Inspiracion**
Displays a random motivational phrase in a brat-inspired text style. A button lets the user generate a new phrase on demand.

**Tareas**
A to-do list screen where the user can add and delete tasks. Tasks are saved locally using `shared_preferences` so they persist between sessions.

## Features

- Auto-cycling image slideshow with fade transitions
- Random motivational phrase generator
- Persistent to-do list (survives app restarts)
- Navigation between screens
- Custom button styles with joined/segmented layout

## Tech Stack

- **Flutter** — UI framework
- **Dart** — programming language
- **shared_preferences** — local data persistence

## Getting Started

### Prerequisites

- Flutter SDK installed
- Dart included with Flutter

### Installation

```bash
git clone https://github.com/cannedcoke/Flutter-the-first.git
cd Flutter-the-first/wan
flutter pub get
```

### Running the app

```bash
flutter run
```

### Building an APK

```bash
flutter build apk
```

The APK will be at `build/app/outputs/flutter-apk/app-release.apk`.

## Assets

The app uses local images stored in the `assets/` folder. Make sure they are declared in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/
```

## License

MIT
