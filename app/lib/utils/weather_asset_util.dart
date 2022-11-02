import 'package:app/utils/asset_utils.dart';
import 'package:domain/domain.dart';

class WeatherAssetUtil {
  WeatherAssetUtil._();

  static String weatherAsset(WeatherEnum weatherEnum, {bool isNight = false}) {
    switch (weatherEnum) {
      case WeatherEnum.unknown:

      case WeatherEnum.clear:
      case WeatherEnum.sunny:
      case WeatherEnum.mostlyClear:
        if (isNight) {
          return AssetUtils.moon;
        }
        return AssetUtils.sun;
      case WeatherEnum.partlyCloudy:
      case WeatherEnum.mostlyCloudy:
      case WeatherEnum.cloudy:
      case WeatherEnum.fog:
      case WeatherEnum.lightFog:
        return AssetUtils.cloudy;
      case WeatherEnum.drizzle:
      case WeatherEnum.freezingDrizzle:
        return AssetUtils.sunWithRain;
      case WeatherEnum.rain:
        return AssetUtils.rain;
      case WeatherEnum.lightRain:
        return AssetUtils.rain;
      case WeatherEnum.heavyRain:
      case WeatherEnum.freezingRain:
      case WeatherEnum.lightFreezingRain:
      case WeatherEnum.heavyFreezingRain:
        return AssetUtils.rain;
      case WeatherEnum.snow:
        return AssetUtils.snow;
      case WeatherEnum.flurries:
        return AssetUtils.snow;
      case WeatherEnum.lightSnow:
        return AssetUtils.snow;
      case WeatherEnum.heavySnow:
        return AssetUtils.snow;
      case WeatherEnum.thunderstorm:
        return AssetUtils.thunderstrom;
      case WeatherEnum.icePellets:
      case WeatherEnum.heavyIcePellets:
      case WeatherEnum.lightIcePellets:
    }
    if (isNight) {
      return AssetUtils.moon;
    }
    return AssetUtils.sun;
  }
}
