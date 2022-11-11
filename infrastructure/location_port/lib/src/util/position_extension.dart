

import 'package:data/data.dart';
import 'package:geolocator/geolocator.dart';

extension GeolocationDataDomainExt on Position {
  GeoLocation mapToDomain() =>
      GeoLocation(longitude: longitude, latitude: latitude);
}