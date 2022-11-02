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
        return Left(l);
      },
      (r) => Right(
        r.data.transform(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, List<Location>>> getLocations() async {
    var response = await safeApiCall(
      apiService.getLocations(),
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(
        r.data.map((e) => e.transform()).toList(),
      ),
    );
  }

  @override
  Future<Either<NetworkError, WeatherDetail>> getTodayTimeline(
    Location location,
  ) async {
    var response = await safeApiCall(
      apiService.getTimeline(
        location.locationId,
        const [
          'temperature',
          'weatherCode',
          'windSpeed',
          'humidity',
        ],
        'now',
        'nowPlus1d',
        '1d',
      ),
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }

  @override
  Future<Either<NetworkError, WeatherDetail>> getFutureTimeLine(
    Location location,
  ) async {
    var response = await safeApiCall(
      apiService.getTimeline(
        location.locationId,
        const [
          'temperature',
          'weatherCode',
          'windSpeed',
          'humidity',
        ],
        'nowPlus2d',
        'nowPlus7d',
        '1d',
      ),
    );
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) => Right(r.data.transform()),
    );
  }
}
