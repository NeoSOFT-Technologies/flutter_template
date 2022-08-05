import 'package:flutter/cupertino.dart';

import '../feature/splash/splash_page.dart';
import 'route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return CupertinoPageRoute(
            builder: (context) => SplashPage(),
            settings: const RouteSettings(name: RoutePaths.Splash));

      default:
        // Replace by Empty Page
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
