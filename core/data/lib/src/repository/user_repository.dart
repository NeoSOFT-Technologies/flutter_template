import 'package:domain/domain.dart';
import '../out/database_port.dart';


class UserRepositoryImpl extends UserRepository {
  final DatabasePort databaseProvider;

  UserRepositoryImpl(this.databaseProvider);

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
