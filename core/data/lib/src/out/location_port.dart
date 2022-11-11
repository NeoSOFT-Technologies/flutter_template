
import 'package:domain/domain.dart';

abstract class LocationPort {
  Future<Either<LocalError, GeoLocation>> getLocation();

  Future<Either<LocalError, LocationPermissions>> checkPermissions();

  Future<Either<LocalError, LocationPermissions>> requestPermissions();

  Future<Either<LocalError, bool>> isLocationServiceEnabled();
}