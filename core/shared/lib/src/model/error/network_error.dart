import '../../const/error_type.dart';
import '../app_error.dart';
import '../error_info.dart';
import 'base_error.dart';

class NetworkError extends BaseError {
  NetworkError({
    required int httpError,
    String message = "",
    required Exception cause,
  }) : super(error: ErrorInfo(code: httpError, message: message), cause: cause);

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 503:
        return AppError(
            error: error, throwable: cause, type: ErrorType.netDefaultError);

      case 504:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      case 502:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      case 404:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      case 400001:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      //so on based on network conditions decided for network error code

      default:
        return AppError(
            throwable: cause, error: error, type: ErrorType.unknown);
    }
  }
}
