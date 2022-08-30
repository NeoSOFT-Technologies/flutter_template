import '../../const/error_type.dart';
import '../app_error.dart';
import '../error_info.dart';
import 'base_error.dart';

class DatabaseError extends BaseError {
  DatabaseError({
    required String message,
    required int databaseError,
    required Exception cause,
  }) : super(
            error: ErrorInfo(message: message, code: databaseError),
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
            type: ErrorType.databaseNotSupported);
      case 2:
        return AppError(
            error: error,
            throwable: cause,
            type: ErrorType.databaseUserNotFound);
      default:
        return AppError(
            error: error, throwable: cause, type: ErrorType.database);
    }
  }
}
