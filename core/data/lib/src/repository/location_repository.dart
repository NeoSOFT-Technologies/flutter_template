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
        case LocationPermissions.allowed:
          return Right(true);
        case LocationPermissions.unableToDetermine:
        case LocationPermissions.denied:
        case LocationPermissions.deniedForever:
        case LocationPermissions.serviceDisabled:
        case LocationPermissions.none:
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
        case LocationPermissions.allowed:
          return Right(true);
        case LocationPermissions.unableToDetermine:
        case LocationPermissions.denied:
        case LocationPermissions.deniedForever:
        case LocationPermissions.serviceDisabled:
        case LocationPermissions.none:
        default:
          return Right(false);
      }
    });
  }
}
