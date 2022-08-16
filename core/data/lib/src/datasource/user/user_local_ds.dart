import 'package:domain/domain.dart';

abstract class UserLocalDS{
  Future<bool> saveUser(User userDBEntity);
}


