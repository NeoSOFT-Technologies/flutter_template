import 'package:domain/domain.dart';

abstract class UserRemoteDS {
  Future<User> loginWithEmail(
      {required String email, required String password});
}
