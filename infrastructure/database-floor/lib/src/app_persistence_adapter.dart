import 'package:data/data.dart';
import 'package:database_floor/src/app_database.dart';

class AppPersistenceAdapter implements DatabasePort {
  final AppDatabase appDatabase;

  AppPersistenceAdapter(this.appDatabase);

  @override
  void fetchPosts() {
    // TODO: implement fetchPosts
  }

  @override
  void reload() {
    // TODO: implement reload
  }

  @override
  void saveUser() {
    // TODO: implement saveUser
  }
}
