import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class WeatherRepository {
  Future<Either<NetworkError, Location>> createLocation({
    required String name,
    required double lat,
    required double lan,
  });
}
