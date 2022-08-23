# Flutter BoilerPlate 

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=NeoSOFT-Technologies_mobile-flutter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=NeoSOFT-Technologies_mobile-flutter) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/NeoSOFT-Technologies/mobile-flutter) [![](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/NeoSOFT-Technologies/mobile-flutter) 

## Table Of Content

- [Overview](#overview)
- [Getting Started](#getting-started)
  * [Requirements](#requirements)
  * [Setup](#setup)
  * [App Secrets](#app-secrets)
- [Change Package Name](#change-package-name)
- [Architecture](#architecture)
- [Running/Debugger](#flavors)
  - [Flavors](#flavors)
  
- [Features](#Features)
- [Library / Dependency](#Libraries-&-Tools-Used)
- [Modules](#Modules)
  * [List Default Modules](#list-default-modules)



## Overview

[Flutter](https://flutter.io/) is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase.

This is a micro-framework for Flutter which is designed to help simplify developing apps. Every project provides a simple boilerplate to help you build apps easier.

This project is open source, we welcome any contributions. 



## Getting Started

#### Requirements

Here are some things you need to prepare before this Boilerplate setup:

1. Flutter SDK Stable (Latest Version) [Install](https://flutter.dev/docs/get-started/install)
2. Android Studio [Install](https://developer.android.com/studio)
3. Visual Studio Code (Optional) [Install](https://code.visualstudio.com/)
4. **Dart** and **Flutter** extensions:
    - **Intellij Platform** users ([Dart](https://plugins.jetbrains.com/plugin/6351-dart), [Flutter](https://plugins.jetbrains.com/plugin/9212-flutter) )
    - **Visual Studio Code** users ([Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code), [Flutter](https://marketplace.visualstudio.com /items?itemName=Dart-Code.flutter))

#### Setup

To set up your project based on this boilerplate, you need to do some of the steps you need to do. 

Here are the steps for setting up a Project with this Flutter-Works boilerplate:

**Step 1:**

In this step you need to download(cloning) the files from this repository to your local computer:

``` bash
git clone https://github.com/NeoSOFT-Technologies/mobile-flutter.git
```

Or

``` bash
git clone git@github.com/NeoSOFT-Technologies/mobile-flutter.git
```

**Step 2:**

The next step is to open the folder that has been downloaded / cloned into a cli application such as `bash`, `cmd`, `terminal` .

And then run this command to the console:

``` bash
flutter pub get
```

After cloning the repo and follow these steps to setup the project.

#### App Secrets

Sensitive information like api keys, credentials, etc should not be checked into git repos, especially public ones. To keep such data safe the template uses `app_secrets.dart` file. If you want to run the app locally, you will need to create a new file `app_secrets.dart` under [`lib/secrets`](app/lib/secrets). To help with setting up the secrets file, the template inclued a skeleton secrets file. 

#### Get Dependencies

```
flutter pub get
```

#### Run Code Generation

```
bash scripts/generate-all.sh
```

Read the [scripts documentation](app/scripts/README.md) to learn about all the scrips used in the project.



## Change Package Name

By default package names:

`com.app.flutter_template`

To change the package name, simply search for all `com.app.flutter_template`, then replace it with the new package name, for example: `com.mycompany.`.

## Architecture

The architecture of the template facilitates separation of concerns and avoids tight coupling between it's various layers. The goal is to have the ability to make changes to individual layers without affecting the entire app. This architecture is an adaptation of concepts from [`Hexagonal`](./wiki/ARCHITECTURE.md) & [`The Clean Architecture`](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) .

### Layers

The architecture is separated into the following layers

The architecture is separated into the following layers

- [`app`](app/): All UI and state management elements like widgets, pages and view models.
- [`core`](./core): Core business implementation
  - [`domain`](core/domain): Use cases for individual pieces of work.
  - [`data`](core/data): Repositories to manage various data sources.
  - [`shared`](core/shared): Common items for core module shared between [`domain`](core/domain)  & [`data`](core/data).
- [`infrastructure`](./infrastructure): Services provide access to external elements such as databases, apis, etc.
  - [`database-floor`](infrastructure/database-floor): [Floor](https://pub.dev/packages/floor) as the Database provider 
  - [`network-retrofit`](infrastructure/network-retrofit): [Retrofit](https://pub.dev/packages/retrofit) as the Database provider 

Each layer has a `di` directory to manage Dependency Injection for that layer.

Read the [dependency management documentation](dependency-injection/README.md) to learn about all the scripts used in the project.

## Flavors

The template comes with built-in support for 3 flavors. Each flavor uses a different `main.dart` file.

- Dev - [`main_dev.dart`](app/lib/entrypoints/main_dev.dart)
- QA - [`main_qa.dart`](app/lib/entrypoints/main_qa.dart)
- Prod - [`main_prod.dart`](app/lib/entrypoints/main_prod.dart)

You can setup any environment specific values in the respective `main.dart` files.

To run a specific flavor you need to specify the flavor and target file.

```sh
 flutter run --flavor qa -t lib/entrypoints/main_qa.dart
```

**To avoid specifying all the flags every time, use the [`run.sh`](app/scripts/README.md#run) script**

Read the [scripts documentation](app/scripts/README.md) to learn about all the scripts used in the project.

### Entities

The layers  `core` and `services provider` within infrastructure each have an `model` directory.

- [`app layer`](https://github.com/wednesday-solutions/flutter_template/blob/main/lib/presentation/entity): We consume the same models used from core/domain as domain wont change in the case of frontend apps.
- [`core/shared/lib/src/model`](core/shared/lib/src/model): Model classes for performing business logic manipulations. They act as an abstraction to hide the local and remote data models.
- [`infrastructure/servicename/model`](https://github.com/wednesday-solutions/flutter_template/blob/main/lib/services/entity): Respective service provider contains local models (data classes for the database) and remote models (data classes for the api).



## Hide Generated Files (Optional)

In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:

```dart
*.config.dart;*.inject.summary;*.inject.dart;*.g.dart;
```

In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:

```dart
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

## Features

- [Hexagonal Clean Architecture](./wiki/ARCHITECTURE.md)
- Adhering to SOLID Principles
- Repository Pattern for code separations
- [Dependency Injection](./dependency-injection/)
- Network Layer
- Data Layer
- Better Logging
- Automatic Error Handling
- Flavors Sample
- Unit & Integration Tests
- CI for build release
- Use SonarQube Analysis & generate reports
- Crashlytics/Analytics
- [Theme Manager](./themes/)
- [Localisation](./localisation/)
- Routing/Navigations
- [Responsive Framework](./wiki/responsive-framework/RESPONSIVE_FRAMEWORK.md)



## Libraries & Tools Used

- Dependency Injection - [Injectable](https://pub.dev/packages/injectable) & [GetIt](https://pub.dev/packages/get_it)
- Network - [Retrofit](https://pub.dev/packages/retrofit)
- Database - [Floor](https://pub.dev/packages/floor)
- Reactive Caching and Data-binding Framework - [RiverPod](https://riverpod.dev/)
- Bloc Framework - [Bloc](https://pub.dev/packages/flutter_bloc)
- Code Analysis - [SonarQube](https://sonarcloud.io/) 
- Crashlytics - [Firebase](https://firebase.google.com/)
- Continuous Integration -  [Github Action](https://github.com/features/actions)
- Secure Storage Module - [Secure Module](https://pub.dev/packages/flutter_secure_storage)
- [Navigation](https://docs.flutter.dev/development/ui/navigation)
- Localisation - [Flutter Intl](https://www.jetbrains.com/help/idea/managing-plugins.html)
- [Responsive Farmework](https://pub.dev/packages/responsive_framework)



## Modules

## List of Default Modules

By default when you use this boilerplate, there are several modules that are installed automatically, here is a list of available modules:

| Name                                                   | Description                                                  |
| ------------------------------------------------------ | ------------------------------------------------------------ |
| [app](./app)                                           | A module containing boilerplate app view implementation      |
| [core](./core)                                         | A module containing core business implementation of the product which includes data,domain & shared modules |
| [dependency-injection](./dependency-injection)         | A module that contains classes to achieve DI across multiple modules  based on `injectable` & `getIt` |
| [infrastructure](./infrastructure)                     | A module that includes all external data providers/adapters which are outbound adapters to `core ` module/ports. Further includes `database-floor`& `network-retrofit`as external ports. |
| [localisation](./localisation)                         | A module containing translation data                         |
| [statemanagement-bloc](./statemanagement-bloc)         | A module which contains `bloc` used as a state management tool. To be used with [statemanagement-core](./statemanagement-core) |
| [statemanagement-core](./statemanagement-core)         | A module which includes base classes required to support state management in flutter. |
| [statemanagement-riverpod](./statemanagement-riverpod) | A module which contains `riverpod` used as a state management tool.  To be used with  [statemanagement-core](./statemanagement-core) |
| [themes](./themes)                                     | A library that contains theme manager implementation         |



## Upcoming Improvements

Checklist of all upcoming [enhancements](https://github.com/NeoSOFT-Technologies/mobile-flutter/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc+label%3Aenhancement).



## Contributing to this Project

Contributions are welcome from anyone and everyone. We encourage you to review the [Guiding principles for contributing](CONTRIBUTING.md)