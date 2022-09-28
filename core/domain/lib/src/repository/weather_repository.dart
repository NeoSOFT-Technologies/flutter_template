import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/model/location.dart';

abstract class WeatherRepository {
  Future<Either<NetworkError, Location>> createLocation({
    required String name,
    required double lat,
    required double lan,
  });
}
