import 'package:data/data.dart';
import 'package:database_floor/src/app_database.dart';
import 'package:database_floor/src/app_persistence_adapter.dart';
import 'package:injectable/injectable.dart';
import '../database_config.dart';
import '../database_migration.dart';

@module
abstract class DataBaseModule {
  @preResolve
  Future<AppDatabase> providerAppDatabase() async {
    return await $FloorAppDatabase
        .databaseBuilder(DatabaseConfig.dbName)
        .addMigrations(DatabaseMigrations.migrations)
        .build();
  }

  @lazySingleton
  DatabasePort providerAppPersistentAdapter(AppDatabase appDatabase) {
    return AppPersistenceAdapter(appDatabase);
  }
}
