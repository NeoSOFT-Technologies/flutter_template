import 'package:flutter/material.dart';

/// This service exposes properties that is required to be set before any of the services can be used
class AppService {
  const AppService._();

  /// Returns the [Get.key] value to be set in the applications navigation
  static GlobalKey<NavigatorState>? get navigatorKey =>
      GlobalKey(debugLabel: 'my-app-key');

  /// Returns the [Get.key] value to be set in the applications material app
  static GlobalKey<State>? get appKey =>
      GlobalKey(debugLabel: 'appKey-app-key');

}
