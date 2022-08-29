// required package imports
import 'dart:async';

import 'package:database_floor/src/database_config.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/user_dao.dart';
import 'model/user_entity.dart';

part 'app_database.g.dart';

@Database(version: DatabaseConfig.dbVersion, entities: [UserDBEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
