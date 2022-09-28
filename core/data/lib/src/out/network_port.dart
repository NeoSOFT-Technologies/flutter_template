import 'package:domain/domain.dart';

abstract class NetworkPort {
  Future<Either<NetworkError,Location>>  createLocation({
    required String name,
    required double lat,
    required double lan,
  });
}
