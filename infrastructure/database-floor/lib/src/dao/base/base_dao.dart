import 'package:floor/floor.dart';

@dao
abstract class BaseDao<T> {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertData(T data);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertDataList(List<T> dataList);
}
