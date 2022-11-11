

import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:location_port/src/location_adapter.dart';

@module
abstract class LocationModule {
  @lazySingleton
  LocationPort providerLocationService() =>
      LocationAdapter();
}
