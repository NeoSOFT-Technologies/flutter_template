import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:services/services.dart';
import 'package:localisation/strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:themes/themes.dart';

import 'navigation/app_router.dart';
import 'navigation/route_paths.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: [
        ThemeData(backgroundColor: Colors.red, accentColor: Colors.blue),
      ],
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.blue[700],
        accentColor: Colors.yellow[700],
      ),
      lightTheme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.blue[300],
        accentColor: Colors.yellow[300],
      ),
      builder: (context, regularTheme, darkTheme, themeMode) =>  MaterialApp(
          navigatorKey: AppService.navigatorKey,
          builder: (context, widget) => ResponsiveWrapper.builder(
                ClampingScrollWrapper.builder(context, widget!),
                maxWidth: 1400,
                minWidth: 360,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(360, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                  const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                  const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                ],
              ),
          localizationsDelegates: const [
            Strings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: Strings.delegate.supportedLocales,
          onGenerateTitle: (context) => Strings.of(context).appName,
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePaths.Splash,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          onGenerateRoute: AppRouter.generateRoute),
    );
  }
}
