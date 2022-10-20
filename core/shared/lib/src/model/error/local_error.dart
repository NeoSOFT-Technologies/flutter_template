import '../../const/error_type.dart';
import '../app_error.dart';
import '../error_info.dart';
import 'base_error.dart';

class LocalError extends BaseError {
  LocalError({
    required String message,
    required int code,
    required Exception cause,
  }) : super(
      error: ErrorInfo(message: message, code: code),
      cause: cause);

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 1:
        return AppError(
            error: error,
            throwable: cause,
            type: ErrorType.locationError);
      default:
        return AppError(
            error: error, throwable: cause, type: ErrorType.locationError);
    }
  }
}
