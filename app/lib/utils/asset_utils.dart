import 'package:flutter/material.dart';

class AssetUtils {
  AssetUtils._();

  static const String _png = "assets/png/";

  static const String sunCloudAngledRain = '${_png}sun_cloud_angled_rain.png';
  static const String sun = '${_png}sun.png';
  static const String cloudy = '${_png}cloudy.png';
  static const String sunWithRain = '${_png}sun_with_rain.png';
  static const String rain = '${_png}rain.png';
  static const String snow = '${_png}snow.png';
  static const String thunderstrom = '${_png}thunderstrom.png';
  static const String moon = '${_png}moon.png';

  static loadAsset(String path) {
    return AssetImage(path);
  }
}
