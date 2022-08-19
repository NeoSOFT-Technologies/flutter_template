# Flutter BoilerPlate 

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=NeoSOFT-Technologies_mobile-flutter&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=NeoSOFT-Technologies_mobile-flutter) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/NeoSOFT-Technologies/mobile-flutter) [![](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/NeoSOFT-Technologies/mobile-flutter) [![MIT License](https://img.shields.io/badge/license-MIT-purple.svg)](https://github.com/NeoSOFT-Technologies/mobile-flutter)



## Table Of Content

- [Overview](#overview)
- [Getting Started](#getting-started)
  * [Requirements](#requirements)
  * [Setup](#setup)
- [Change Package Name](#change-package-name)
- [Running/Debugger](#running-debugger)
  * [1. Dev Mode (Development)](#1-mode-dev--development-)
  * [2. Staging Mode](#2-mode-staging)
  * [3. Mode Prod (Production)](#3-mode-prod--production-)
  * [If User VS Code](#if-user-vs-code)
- [Features](#Features)
- [Library / Dependency](#Libraries & Tools Used)
- [Folder Structure](#folder-structure)
- [Modules](#Modules)
  * [List Default Modules](#list-default-modules)
- [Global Config/Variable](#global-config-variable)
  * [Call Global Variable](#call-global-variable)
- [Generate Icon Launcher](#generate-icon-launcher)



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