import 'package:data/src/out/database_port.dart';
import 'package:data/src/out/network_port.dart';
import 'package:data/src/repository/weather_repository.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_helper.dart';
import 'weather_repository_test.mocks.dart';

@GenerateMocks([DatabasePort, NetworkPort])
void main() {
  late DatabasePort databasePort;
  late NetworkPort networkPort;
  late WeatherRepository weatherRepository;

  setUp(() {
    databasePort = MockDatabasePort();
    networkPort = MockNetworkPort();
    weatherRepository = WeatherRepositoryImpl(
      databasePort,
      networkPort,
    );
  });

  test('create location test', () async {
    when(
      networkPort.createLocation(
        name: TestHelper.locationName,
        lan: TestHelper.lan,
        lat: TestHelper.lat,
      ),
    ).thenAnswer(
      (locationResponse) => Future.value(
        Right(
          Location(
            locationId: TestHelper.locationId,
            name: TestHelper.locationName,
            geometryLocation: GeometryLocation(
              type: TestHelper.locationType,
              coordinates: [231, 2312],
            ),
          ),
        ),
      ),
    );
    Either<NetworkError, Location> response = await weatherRepository.createLocation(
      name: TestHelper.locationName,
      lan: TestHelper.lan,
      lat: TestHelper.lat,
    );
    String locationId = response.fold((l) => throw Exception(), (r) => r.locationId);
    expect(
      TestHelper.locationId,
      locationId,
    );
  });

  test('get locations', () async {
    when(
      networkPort.getLocations(),
    ).thenAnswer(
      (locationResponse) => Future.value(
        Right(
          [
            Location(
              locationId: TestHelper.locationId,
              name: TestHelper.locationName,
              geometryLocation: GeometryLocation(
                type: TestHelper.locationType,
                coordinates: [
                  TestHelper.lat,
                  TestHelper.lan,
                ],
              ),
            ),
          ],
        ),
      ),
    );
    Either<NetworkError, List<Location>> response = await weatherRepository.getLocations();
    List<Location> locations = response.fold((l) => throw Exception(), (r) => r);
    expect(
      1,
      locations.length,
    );
  });
}
