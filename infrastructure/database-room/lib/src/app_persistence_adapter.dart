import 'package:data/data.dart';
import 'package:database_room/src/services/floor_service.dart';
import 'package:floor/floor.dart';


class AppPersistenceAdapter implements UserLocalDS{
  final FloorService floorService;

  AppPersistenceAdapter(this.floorService);

  @override
  Future<bool> saveUser(User userDBEntity) {
    // TODO: implement saveUser

    throw UnimplementedError();
  }

}