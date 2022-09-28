import 'package:data/data.dart';
import 'package:network_retrofit/src/model/request/create_location_request.dart';
import 'package:network_retrofit/src/model/request/geometry_request.dart';
import 'package:network_retrofit/src/util/safe_api_call.dart';
import 'package:dartz/dartz.dart';
import 'services/retrofit_service.dart';

class NetworkAdapter implements NetworkPort {
  final RetrofitService apiService;

  NetworkAdapter(this.apiService);

  @override
  Future<Either<NetworkError, Location>> createLocation({
    required String name,
    required double lat,
    required double lan,
  }) async {
    var response = await safeApiCall(
      apiService.createLocation(
        CreateLocationRequest(
          name: name,
          geometryRequest: GeometryRequest(
            coordinates: [
              lan,
              lat,
            ],
          ),
        ),
      ),
    );
    return response.fold(
      (l) {
        print("networkAdapter error is ${l.error.code}");
        return Left(l);
      },
      (r) => Right(
        r.data.transform(),
      ),
    );
  }
}
