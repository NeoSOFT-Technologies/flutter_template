enum WeatherEnum {
  unknown,
  clear,
  sunny,
  mostlyClear,
  partlyCloudy,
  mostlyCloudy,
  cloudy,
  fog,
  lightFog,
  drizzle,
  rain,
  lightRain,
  heavyRain,
  snow,
  flurries,
  lightSnow,
  heavySnow,
  freezingDrizzle,
  freezingRain,
  lightFreezingRain,
  heavyFreezingRain,
  icePellets,
  heavyIcePellets,
  lightIcePellets,
  thunderstorm,
}

extension WeatherEnumExtention on WeatherEnum {
  WeatherEnum fromCode(num value) {
    switch (value) {
      case 0:
        return WeatherEnum.unknown;
      case 1000:
        return WeatherEnum.clear;
      case 1100:
        return WeatherEnum.mostlyClear;
      case 1101:
        return WeatherEnum.partlyCloudy;
      case 1102:
        return WeatherEnum.mostlyCloudy;
      case 1001:
        return WeatherEnum.cloudy;
      case 2000:
        return WeatherEnum.fog;
      case 2100:
        return WeatherEnum.lightFog;
      case 4000:
        return WeatherEnum.drizzle;
      case 4001:
        return WeatherEnum.rain;
      case 4200:
        return WeatherEnum.lightRain;
      case 4201:
        return WeatherEnum.heavyRain;
      case 5000:
        return WeatherEnum.snow;
      case 5001:
        return WeatherEnum.flurries;
      case 5100:
        return WeatherEnum.lightSnow;
      case 5101:
        return WeatherEnum.heavySnow;
      case 6000:
        return WeatherEnum.freezingDrizzle;
      case 6001:
        return WeatherEnum.freezingRain;
      case 6200:
        return WeatherEnum.lightFreezingRain;
      case 6201:
        return WeatherEnum.heavyFreezingRain;
      case 7000:
        return WeatherEnum.icePellets;
      case 7101:
        return WeatherEnum.heavyIcePellets;
      case 7102:
        return WeatherEnum.lightIcePellets;
      case 8000:
        return WeatherEnum.thunderstorm;
      default:
        return WeatherEnum.unknown;
    }
  }
}
