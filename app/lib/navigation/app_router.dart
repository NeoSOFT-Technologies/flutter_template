import 'package:app/feature/dashboard/dashboard_page.dart';
import 'package:app/feature/weather_detail/weather_detail_page.dart';
import 'package:flutter/cupertino.dart';
import '../feature/dashboard/dashboard_page.dart';
import '../feature/splash/splash_page.dart';
import 'route_paths.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return CupertinoPageRoute(
            builder: (context) => const SplashPage(),
            settings: const RouteSettings(name: RoutePaths.splash));
      case RoutePaths.dashboard:
        return CupertinoPageRoute(
            builder: (context) => const DashboardPage(),
            settings: const RouteSettings(name: RoutePaths.dashboard));

      case RoutePaths.weatherDetail:
        return CupertinoPageRoute(
            builder: (context) => WeatherDetailPage(
                  param: settings.arguments as WeatherDetailPageParam,
                ),
            settings: const RouteSettings(name: RoutePaths.weatherDetail));

      default:
        // Replace by Empty Page
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
