# Kountdown
This project is a simple desktop app to add countdown reminders, using KDE's **Kirigami** Framework, **Qt6** and **C++** backend with SQLite for local storage.

## Platforms
- Linux/MacOS, works as expected.
- Yet to test on Windows.
- Facing severe build issues with Android.

## How to setup
- Install CMake, Make, gcc/clang and Qt6 for Desktop and Android.
- Get `kde-builder` from [here](https://kde-builder.kde.org/en/) (optional).
- Get `kirigami` from [here](https://develop.kde.org/docs/getting-started/kirigami/introduction-getting_started/).
- Test out the tools with `kcalc` as a sample application, using `kde-builder`.
- Setup Android Studio with a simulator device, with API Level 30 or more.
- Using something like QtCreator, configure the CMake flags as mentioned in [their Android documentation](https://doc.qt.io/qt-6/deployment-android.html#android-package-templates).

## Compilation Steps
- Compile with CMake and Make, or use the recommended `kde-builder` tool.
