import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:network_retrofit/src/model/error/error_info_entity.dart';

NetworkError getError({required Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      final errorResponseEntity = ErrorInfoEntity.fromJson(apiResponse.data);
      print("errorResponseEntity is ${errorResponseEntity.message}");
      if (errorResponseEntity != null) {
        return NetworkError(
            httpError: errorResponseEntity.code ?? 1000,
            message: errorResponseEntity.message ?? '',
            cause: Exception("Server Response Error"));
      } else {
        return NetworkError(
            httpError: apiResponse.statusCode!,
            cause: Exception("Server Response Error"),
            message: apiResponse.statusMessage!);
      }
    } catch (exception) {
      // exception.printStackTrace();
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
