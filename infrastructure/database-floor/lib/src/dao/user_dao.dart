import 'package:floor/floor.dart';
import '../constants/database_tables.dart';
import '../model/user_entity.dart';
import 'base/base_dao.dart';

@dao
abstract class UserDao extends BaseDao<UserDBEntity> {

  @Query("SELECT * FROM ${Table.USER} ORDER BY firstName ASC")
  Stream<List<UserDBEntity>> getUsers();

  @Query("SELECT * FROM ${Table.USER} WHERE email=:email")
  Future<UserDBEntity?> getUserByEmail(String email);

  @Query("SELECT * FROM ${Table.USER}")
  Future<List<UserDBEntity>> getUsersList();
}