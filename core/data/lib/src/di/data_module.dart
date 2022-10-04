import 'package:data/data.dart';
import 'package:data/src/repository/location_repository.dart';
import 'package:data/src/repository/user_repository.dart';
import 'package:data/src/repository/weather_repository.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @lazySingleton
  UserRepository userRepositoryProvider(
    DatabasePort databasePort,
    NetworkPort networkPort,
  ) {
    return UserRepositoryImpl(databasePort, networkPort);
  }

  @lazySingleton
  LocationRepository locationRepositoryProvider(LocationPort locationPort) {
    return LocationRepositoryImpl(locationPort);
  }

  @lazySingleton
  WeatherRepository weatherRepositoryProvider(
    DatabasePort databasePort,
    NetworkPort networkPort,
  ) {
    return WeatherRepositoryImpl(databasePort, networkPort);
  }
}
