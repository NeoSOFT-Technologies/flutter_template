import 'package:shared/src/model/geometry_location.dart';

class Location {
  final String locationId;
  final String name;
  final GeometryLocation geometryLocation;

  Location({
    required this.locationId,
    required this.name,
    required this.geometryLocation,
  });
}
