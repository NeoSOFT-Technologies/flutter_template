import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_port/src/util/position_extension.dart';

class LocationAdapter implements LocationPort {
  @override
  Future<Either<LocalError, LocationPermissions>> checkPermissions() async {
    try {
      final enabled = await Geolocator.isLocationServiceEnabled();
      if (enabled) {
        final LocationPermission permissionStatus =
        await Geolocator.checkPermission();

        switch (permissionStatus) {
          case LocationPermission.always:
          case LocationPermission.whileInUse:
            return const Right(LocationPermissions.allowed);

          case LocationPermission.denied:
            return const Right(LocationPermissions.denied);

          case LocationPermission.unableToDetermine:
            return const Right(LocationPermissions.unableToDetermine);

          case LocationPermission.deniedForever:
          default:
            return const Right(LocationPermissions.deniedForever);
        }
      } else {
        return const Right(LocationPermissions.serviceDisabled);
      }
    } catch (exception) {
      return Left(LocalError(cause: exception as Exception,
        message: exception.toString(),
        code: 1,));
    }
  }

  @override
  Future<Either<LocalError, GeoLocation>> getLocation() async {
    try {
      final Position locationData = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return Right(locationData.mapToDomain());
    } catch (exception) {
      return Left(LocalError(cause: exception as Exception,
          message: exception.toString(),
          code: 1,));
    }
  }

  @override
  Future<Either<LocalError, bool>> isLocationServiceEnabled() async{
    try {
      return Right(await Geolocator.isLocationServiceEnabled());
    }catch (exception) {
      return Left(LocalError(cause: exception as Exception,
        message: exception.toString(),
        code: 1,));
    }
  }

  @override
  Future<Either<LocalError, LocationPermissions>> requestPermissions() async {
    try {
      final enabled = await Geolocator.isLocationServiceEnabled();
      if (enabled) {
        final LocationPermission permissionStatus =
        await Geolocator.requestPermission();

        switch (permissionStatus) {
          case LocationPermission.always:
          case LocationPermission.whileInUse:
            return const Right(LocationPermissions.allowed);

          case LocationPermission.denied:
            return const Right(LocationPermissions.denied);

          case LocationPermission.unableToDetermine:
            return const Right(LocationPermissions.unableToDetermine);

          case LocationPermission.deniedForever:
          default:
            return const Right(LocationPermissions.deniedForever);
        }
      } else {
        return const Right(LocationPermissions.serviceDisabled);
      }
    } catch (exception) {
      return Left(LocalError(cause: exception as Exception,
        message: exception.toString(),
        code: 1,));
    }
  }

}