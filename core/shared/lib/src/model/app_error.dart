import '../const/error_type.dart';
import 'error_info.dart';

class AppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception throwable;

  AppError({
    required this.throwable,
    required this.error,
    required this.type,
  });
}
