import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../../utils/request_manager.dart';

@injectable
class HomePageViewModel extends BasePageViewModel {
  final CheckLocationPermissionUseCase checkLocationPermissionUseCase;
  final RequestLocationPermissionUseCase requestLocationPermissionUseCase;
  final GetLocationUseCase getLocationUseCase;

  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  HomePageViewModel(
      this.checkLocationPermissionUseCase,
      this.requestLocationPermissionUseCase,
      this.getLocationUseCase,
      this.exceptionHandlerBinder);



  void fetchCurrentLocation(){
    exceptionHandlerBinder.handle(block: (){
      GetLocationUseCaseParams params = GetLocationUseCaseParams();
      RequestManager<GeoLocation>(
        params,
        createCall: () => getLocationUseCase.execute(params: params),
      ).asFlow().listen((result) {
          debugPrint("Current Location latitude ${result.data?.latitude}");
          debugPrint("Current Location longitude ${result.data?.longitude}");
      });
    }).execute();
  }

  void requestLocationPermission(){
    exceptionHandlerBinder.handle(block: (){
      RequestLocationPermissionUseCaseParams params = RequestLocationPermissionUseCaseParams();
      RequestManager<bool>(
        params,
        createCall: () => requestLocationPermissionUseCase.execute(params: params),
      ).asFlow().listen((result) {
        debugPrint("Location Permission request is: ${result.data}");
      });
    }).execute();
  }

  void checkLocationPermission(){
    exceptionHandlerBinder.handle(block: (){
      CheckLocationPermissionUseCaseParams params = CheckLocationPermissionUseCaseParams();
      RequestManager<bool>(
        params,
        createCall: () => checkLocationPermissionUseCase.execute(params: params),
      ).asFlow().listen((result) {
        debugPrint("Location Permission allowed is: ${result.data}");
      });
    }).execute();
  }
}
