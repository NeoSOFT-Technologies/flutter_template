import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../model/resource.dart';
import '../../utils/request_manager.dart';

@injectable
class DashboardViewModel extends BasePageViewModel {
  final CheckLocationPermissionUseCase checkLocationPermissionUseCase;
  final RequestLocationPermissionUseCase requestLocationPermissionUseCase;
  final GetLocationUseCase getLocationUseCase;
  final CreateLocationUseCase createLocationUseCase;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  DashboardViewModel(
      this.checkLocationPermissionUseCase,
      this.requestLocationPermissionUseCase,
      this.getLocationUseCase,
      this.createLocationUseCase,
      this.exceptionHandlerBinder);

  void createLocation({
    required String name,
    required double lat,
    required double lan,
  }) {
    exceptionHandlerBinder.handle(block: () {
      CreateLocationUseCaseParams params = CreateLocationUseCaseParams(
        name: name,
        lan: lan,
        lat: lat,
      );
      RequestManager<Location>(
        params,
        createCall: () => createLocationUseCase.execute(params: params),
      ).asFlow().listen((result) {
        if (result.status == Status.success) {
          debugPrint("location name is ${result.data?.name}");
          debugPrint("location id is ${result.data?.locationId}");
        }
      });
    }).execute();
  }

  void fetchCurrentLocation() {
    exceptionHandlerBinder.handle(block: () {
      GetLocationUseCaseParams params = GetLocationUseCaseParams();
      RequestManager<GeoLocation>(
        params,
        createCall: () => getLocationUseCase.execute(params: params),
      ).asFlow().listen((result) {
        debugPrint("Current Location latitude ${result.data?.latitude}");
        debugPrint("Current Location longitude ${result.data?.longitude}");
        createLocation(
            name: '',
            lat: (result.data?.latitude ?? 0.0),
            lan: (result.data?.longitude ?? 0.0));
      });
    }).execute();
  }

  void requestLocationPermission() {
    exceptionHandlerBinder.handle(block: () {
      RequestLocationPermissionUseCaseParams params =
          RequestLocationPermissionUseCaseParams();
      RequestManager<bool>(
        params,
        createCall: () =>
            requestLocationPermissionUseCase.execute(params: params),
      ).asFlow().listen((result) {
        debugPrint("Location Permission request is: ${result.data}");
        if (result.data ?? false) {
          fetchCurrentLocation();
        } else {
          ///TODO: SHow Toast Message to user
        }
      });
    }).execute();
  }

  void checkLocationPermission() {
    exceptionHandlerBinder.handle(block: () {
      CheckLocationPermissionUseCaseParams params =
          CheckLocationPermissionUseCaseParams();
      RequestManager<bool>(
        params,
        createCall: () => checkLocationPermissionUseCase
            .execute(params: params)
            .onError((error, stackTrace) {
              debugPrint(error.toString());
              return Left(error as BaseError);
        }),
      ).asFlow().listen((result) {
        debugPrint("Location Permission allowed is: ${result.data}");
        if (result.data ?? false) {
          fetchCurrentLocation();
        } else {
          requestLocationPermission();
        }
      });
    }).execute();
  }
}
