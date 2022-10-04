import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class ApiInterceptor extends InterceptorsWrapper {
  final String apiKey;

  ApiInterceptor(
    @factoryParam this.apiKey,
  );

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("api key is $apiKey");
    options.queryParameters.putIfAbsent(
      "apikey",
      () => apiKey,
    );
    return handler.next(options);
  }
}
