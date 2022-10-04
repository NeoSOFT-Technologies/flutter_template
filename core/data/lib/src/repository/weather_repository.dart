import 'package:domain/domain.dart';

import '../out/database_port.dart';
import '../out/network_port.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final DatabasePort databaseProvider;
  final NetworkPort networkPort;

  WeatherRepositoryImpl(this.databaseProvider, this.networkPort);

  @override
  Future<Either<NetworkError, Location>> createLocation({
    required String name,
    required double lat,
    required double lan,
  }) async {
    return networkPort.createLocation(name: name, lat: lat, lan: lan);
  }
}
