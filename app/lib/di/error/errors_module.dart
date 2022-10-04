import 'package:app/errors/flutter_alert_error_presenter.dart';
import 'package:app/errors/flutter_snack_bar_error_presenter.dart';
import 'package:app/model/alert_texts.dart';
import 'package:data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';

import '../../errors/flutter_toast_error_presenter.dart';

@module
abstract class ErrorsModule {
  @singleton
  FlutterToastErrorPresenter providesToastErrorPresenter() {
    return FlutterToastErrorPresenter();
  }

  @singleton
  FlutterSnackBarErrorPresenter providesSnackBarErrorPresenter() {
    return FlutterSnackBarErrorPresenter();
  }

  @singleton
  FlutterAlertErrorPresenter providesFlutterAlertErrorPresenter() {
    return FlutterAlertErrorPresenter();
  }

  @singleton
  SelectorErrorPresenter providesSelectorErrorPresenter(
      FlutterToastErrorPresenter toastErrorPresenter,
      FlutterSnackBarErrorPresenter snackBarErrorPresenter,
      FlutterAlertErrorPresenter alertErrorPresenter) {
    return SelectorErrorPresenter((e) {
      switch (e.runtimeType) {
        case FormatException:
          return toastErrorPresenter;

        case NetworkError:
          return alertErrorPresenter;

        default:
          return snackBarErrorPresenter;
      }
    });
  }

  @lazySingleton
  ExceptionMapperStorage providersGlobalErrors() {
    return ExceptionMapperStorage.instance
        .register<NetworkError, String>((e) => "NetworkError registered error")
        .register<FormatException, String>(
            (e) => "Format Exception registered error")
        .condition<AlertTexts>(
            (e) => (e is NetworkError) && e.error.code == 1,
            (e) => AlertTexts(
                title: 'NetworkError code error 1', message: 'error 1 message'))
        .setFallBackValue(AlertTexts(
            title: 'Alert default title', message: 'Alert Default Message'));
  }

  @singleton
  FlutterExceptionHandlerBinder providerDefaultExceptionHandler(
      SelectorErrorPresenter errorPresenter,
      ExceptionMapperStorage exceptionMappersStorage) {
    return FlutterExceptionHandlerBinderImpl(
        exceptionMapperStorage: exceptionMappersStorage.throwableMapper(),
        flutterErrorPresenter: errorPresenter,
        flutterEventsDispatcher: FlutterEventsDispatcher(),
        onCatch: (Exception e) {
          debugPrint("Exception found $e");
        });
  }
}
