import 'package:floor/floor.dart';

class DatabaseMigrations {
  static _dbMigration1To2() => Migration(1, 2, (database) async {
        await database
            .execute("ALTER TABLE user ADD COLUMN isVerified BOOL DEFAULT 0");
      });

  static final List<Migration> migrations = [
    _dbMigration1To2(),
  ];
}
