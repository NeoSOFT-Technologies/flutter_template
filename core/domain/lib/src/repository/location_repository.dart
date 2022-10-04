
import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

abstract class LocationRepository {
  Future<Either<LocalError, GeoLocation>> getLocation();

  Future<Either<LocalError, bool>> checkPermissions();

  Future<Either<LocalError, bool>> requestPermissions();

  Future<Either<LocalError, bool>> isLocationServiceEnabled();
}