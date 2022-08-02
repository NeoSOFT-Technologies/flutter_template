# Localisation - Flutter Intl



This i18n plugin creates a binding between your translations from .arb files and your Flutter app. It generates boilerplate code for official Dart Intl library and adds auto-complete for keys in Dart code.

This plugin is also available for Visual Studio Code: [Flutter Intl for VS Code](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl)

CLI tool [intl_utils](https://pub.dev/packages/intl_utils) can be used for manual invocation or in CI/CD systems.

### Getting Started

### 1. Install the plugin

[Install from the Plugin Marketplace](https://www.jetbrains.com/help/idea/managing-plugins.html).

### 2. Initialize plugin for your project

Open your project, and run **Initialize for the Project** command from **Tools | Flutter Intl** menu (command explained below).

By default *en* locale is added by auto-creating a file  *../l10n/intl_en.arb*.

**NOTE**: By default the plugin generates and maintains files inside *../generated/* folder which you should not edit manually. But you should keep these files in your project repository.

### 3. Set up your app

Add dependency needed for localization:

```
dependencies:
    // Other dependencies...
    localisation:
        path: ../localisation/
```

Setup your *localizationsDelegates* and your *supportedLocales* which will allow accessing the strings.

```
import 'package:localisation/strings.dart';

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            localizationsDelegates: [
                Strings.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'Flutter Demo',
            home: new MyHomePage(title: 'Flutter Demo Home Page'),
        );
    }
}
```

## Use of Translation/Localization

For data translation, it is in the module `localisation`which is located in `/localisation`. All translation data in your app is loaded in this module. By default, there is 1 supported language, namely **English** .

### Create Item Translation

To create a translation item you need to generate from code `arb`to `dart`. But don't worry, in this boilerplate, the translation generate feature is already available, for translation data you can check in the folder in the `/localisation` module `l10n`, where the file has the extension `.arb`. For an example, see this:

```
{
  "hello": "Hello World"
}
```

So in the extension `.arb`, the data format is exactly the same as the format, `.json` so it's definitely more familiar. Where each item has `key`and `value`. In the above example `"hello"` is as `key` and `"Hello World"` is as value.

- `key`is the name of the variable to be generated
- `value` is the text that will be displayed in each language respectively

> **Note:** if you make a translation, make sure all the languages `key`are in all the languages in the folder`localisation/src/l10n`

**If you want to add param in translation **

```
{ // intl_en.arb
  "hello": "Hello my name is {name}"
}
{ // intl_id.arb
  "hello": "Halo namaku adalah {name}"
}
```

Where the sign `{}`means that there is an input param if it is called.

> **Note:** Make sure if you add param/plural in the translation item you must add it in all language localizations

## Generate Translation

Every time there is the slightest change in the folder in the `localisation/src/l10n`module `l10n`, you need to re-generate the code

1. You can either install [Flutter Intl](https://plugins.jetbrains.com/plugin/13666-flutter-intl) plugin which autogenerates strings when updated in Android Studio / VSCode. Or 

2. You just use a command like this:

```
./generate_l10n.sh
```

Before you execute this script you need to make below changes,

```
#Comment this dependency
#flutter_localizations:
  #sdk: flutter

#uncomment below dependency
dev_dependencies:
intl_utils: ^1.9.0  
```

 so that the code results can be updated.
