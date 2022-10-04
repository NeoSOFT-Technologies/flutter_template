import 'package:data/data.dart';
import 'package:domain/domain.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationPort locationPort;

  LocationRepositoryImpl(this.locationPort);

  @override
  Future<Either<LocalError, bool>> checkPermissions() async {
    var locationPermissionResponse = await locationPort.checkPermissions();
    return locationPermissionResponse.fold((l) {
      return Left(l);
    }, (permission) {
      switch (permission) {
        case LocationPermissions.ALLOWED:
          return Right(true);
        case LocationPermissions.UNABLE_TO_DETERMINE:
        case LocationPermissions.DENIED:
        case LocationPermissions.DENIED_FOREVER:
        case LocationPermissions.SERVICE_DISABLED:
        case LocationPermissions.NONE:
        default:
          return Right(false);
      }
    });
  }

  @override
  Future<Either<LocalError, GeoLocation>> getLocation() {
    return locationPort.getLocation();
  }

  @override
  Future<Either<LocalError, bool>> isLocationServiceEnabled() {
    return locationPort.isLocationServiceEnabled();
  }

  @override
  Future<Either<LocalError, bool>> requestPermissions() async {
    var locationPermissionResponse = await locationPort.requestPermissions();
    return locationPermissionResponse.fold((l) {
      return Left(l);
    }, (permission) {
      switch (permission) {
        case LocationPermissions.ALLOWED:
          return Right(true);
        case LocationPermissions.UNABLE_TO_DETERMINE:
        case LocationPermissions.DENIED:
        case LocationPermissions.DENIED_FOREVER:
        case LocationPermissions.SERVICE_DISABLED:
        case LocationPermissions.NONE:
        default:
          return Right(false);
      }
    });
  }
}
