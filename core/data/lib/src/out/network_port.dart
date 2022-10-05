import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError, Location>> createLocation({
    required String name,
    required double lat,
    required double lan,
  });

  Future<Either<NetworkError, List<Location>>> getLocations();

  Future<Either<NetworkError, WeatherDetail>> getTodayTimeline(
    Location location,
  );

  Future<Either<NetworkError, WeatherDetail>> getFutureTimeLine(
    Location location,
  );
}
