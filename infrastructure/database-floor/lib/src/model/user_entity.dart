import 'package:data/data.dart';
import 'package:floor/floor.dart';

import '../constants/database_tables.dart';

@Entity(tableName: Table.USER, indices: [
  Index(value: ['email'], unique: true)
])
class UserDBEntity extends BaseLayerDataTransformer<UserDBEntity, User> {
  @primaryKey
  String? email;
}
