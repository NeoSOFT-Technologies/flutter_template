import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class WeatherRepository {
  Future<Either<NetworkError, Location>> createLocation({
    required String name,
    required double lat,
    required double lan,
  });

  Future<Either<NetworkError, List<Location>>> getLocations();

  Future<Either<NetworkError, WeatherDetail>> getTodayTimeline(
    Location location,
  );

  Future<Either<NetworkError, WeatherDetail>> getFutureTimeline(
    Location location,
  );
}
