# flutter_project_templates

A new Flutter project structure using isar database and riverpod state management.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

## Project Structure
```

lib
├─ src
│  ├─ constants
│  │   ├── constants.dart
│  │   └── custom.routes.dart
│  │
│  ├─ db
│  │   ├── isar.dart
│  │   └── paths.dart
│  │ 
│  ├─ localization
│  │   ├── app_en.arb
│  │   └── localization.dart
│  │ 
│  ├─ modules
│  │   ├─ home
│  │   │   ├─ api
│  │   │   │   └── home.api.dart
│  │   │   ├─ function
│  │   │   │   └── home.function.dart
│  │   │   ├─ model
│  │   │   │   └── home.model.dart
│  │   │   ├─ provider
│  │   │   │   └── home.provider.dart
│  │   │   └─ view
│  │   │       └── home.view.dart
│  │   │
│  │   ├─ router
│  │   │   ├─ api
│  │   │   │   └── router.api.dart
│  │   │   ├─ function
│  │   │   │   └── router.function.dart
│  │   │   ├─ model
│  │   │   │   └── router.model.dart
│  │   │   ├─ provider
│  │   │   │   └── router.provider.dart
│  │   │   └─ view
│  │   │       └── app.router.dart
│  │   │
│  │   ├─ setting
│  │   │   ├─ model
│  │   │   │   ├── setting.model.dart
│  │   │   │   ├── setting.model.ext.dart
│  │   │   │   └── setting.model.g.dart
│  │   │   ├─ provider
│  │   │   │   └── setting.provider.dart
│  │   │   └─ view
│  │   │       └── setting.view.dart
│  │   │
│  │   └─ module 1....
│  │       ├─ api
│  │       │   └── module 1.api.dart
│  │       ├─ function
│  │       │   └── module 1.function.dart
│  │       ├─ model
│  │       │   └── module 1.model.dart
│  │       ├─ provider
│  │       │   └── module 1.provider.dart
│  │       └─ view
│  │           └── module 1.view.dart
│  │ 
│  ├─ theme
│  │   ├─ model
│  │   │   ├── theme.model.dart
│  │   │   └── theme.model.ext.dart
│  │   ├─ provider
│  │   │   └── theme.provider.dart
│  │   └─ themes
│  │       ├─ dark
│  │       │   └── dark.theme.dart
│  │       ├─ light
│  │       │   └── light.theme.dart
│  │       └─ themes.dart
│  │ 
│  ├─ utils
│  │   ├─ extensions
│  │   │   ├─ src
│  │   │   │   ├── date.time.dart
│  │   │   │   ├── enum.dart
│  │   │   │   ├── iterable.dart
│  │   │   │   └── string.dart
│  │   │   └─ extensions.dart
│  │   └─ log
│  │       └── log.dart
│  │ 
│  └─ app.dart
│  
└─ main.dart

test
├── unit
│   ├── module1
│   │   └── module1_test.dart
│   └── ...
├── integration
│   ├── module1
│   │   └── module1_test.dart
│   └── ...
└── widget
    ├── module1
    │   └── module1_test.dart
    └── ...

```
