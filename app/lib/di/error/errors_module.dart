import 'package:app/errors/flutter_snack_bar_error_presenter.dart';
import 'package:data/data.dart';
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

  @lazySingleton
  ExceptionMappers providersGlobalErrors() {
    return ExceptionMappers()
        /*.condition<String>((e) => e is NetworkError && e.error.code == 1,
            (e) => "My custom error from mapper")*/
        .register<NetworkError, String>((e) => "NetworkError registered error")
        .register<FormatException, String>(
            (e) => "Format Exception registered error");
  }

  @singleton
  FlutterExceptionHandlerBinder providerDefaultExceptionHandler(
      FlutterToastErrorPresenter errorPresenter,
      ExceptionMappers exceptionMappersStorage) {
    return FlutterExceptionHandlerBinderImpl<String>(
        exceptionMappersStorage.throwableMapper(),
        errorPresenter,
        FlutterEventsDispatcher(),
        (Exception e) {});
  }
}
