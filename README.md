# Flutter Kick Start Project Pattern [[Isar](https://isar.dev/) & [Riverpod](https://riverpod.dev/)]

A new Flutter project where basically show a pattern that used I follow. This pattern isn't fully made by me. I gather some ideas from various sources and seniors. After that, I merge those ideas according to my own opinion to make it more understandable to the beginner as I'm also a beginner.

Hope you like it.

<br>

## Commands:

- project create: ```flutter create -t skeleton -a java -i swift --org com.sabikrahat project_app```

- model creation: ```flutter packages pub run build_runner build --delete-conflicting-outputs```

## For more information:
- [Personal Info](https://rahat.algoramming.com/)

<br>

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
│  │   └─ modules....
│  │       ├─ api
│  │       │   ├── modules.api.dart
│  │       │   └── ...
│  │       ├─ function
│  │       │   ├── modules.function.dart
│  │       │   └── ...
│  │       ├─ model
│  │       │   ├── modules.model.dart
│  │       │   └── ...
│  │       ├─ provider
│  │       │   ├── modules.provider.dart
│  │       │   └── ...
│  │       └─ view
│  │           ├── modules.view.dart
│  │           └── ...
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
