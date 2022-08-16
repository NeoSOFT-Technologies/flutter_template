import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl extends UserRepository {

  @override
  Future<Either<NetworkError, User>> loginWithEmail(
      {required String email, required String password}) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
