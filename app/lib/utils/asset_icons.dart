import 'package:flutter/widgets.dart';

class AssetIcons {
  AssetIcons._();

  static const String _imageFolder = "assets/image/";
  static const String _vector = "assets/vector/";

  /// Images
  static const AssetImage bigRain =
      AssetImage("${_imageFolder}big_rain_ drops.png");
  static const AssetImage bigSnow = AssetImage("${_imageFolder}big_snow.png");
  static const AssetImage cloudZap =
      AssetImage("${_imageFolder}cloud_3_zap.png");
  static const AssetImage midSnowFastRain =
      AssetImage("${_imageFolder}mid_snow_fast_winds.png");
  static const AssetImage moonCloudFastWind =
      AssetImage("${_imageFolder}moon_cloud_fast_wind.png");
  static const AssetImage moonCloudMidRain =
      AssetImage("${_imageFolder}moon_cloud_mid_rain.png");
  static const AssetImage moonFastWind =
      AssetImage("${_imageFolder}moon_fast_wind.png");
  static const AssetImage sunCloudAngledRain =
      AssetImage("${_imageFolder}sun_cloud_angled_rain.png");
  static const AssetImage sunCloudLittleRain =
      AssetImage("${_imageFolder}sun_cloud_little_rain.png");

  static const AssetImage sunCloudMidRain =
      AssetImage("${_imageFolder}sun_cloud_mid_rain.png");
  static const AssetImage tornado = AssetImage("${_imageFolder}tornado.png");
  static const AssetImage zaps = AssetImage("${_imageFolder}zaps.png");

  ///Vectors
  static const AssetImage home = AssetImage("${_vector}home.svg");
  static const AssetImage navigation = AssetImage("${_vector}navigation.svg");
  static const AssetImage profile = AssetImage("${_vector}account_avtar.svg");
  static const AssetImage search = AssetImage("${_vector}search.svg");
}
