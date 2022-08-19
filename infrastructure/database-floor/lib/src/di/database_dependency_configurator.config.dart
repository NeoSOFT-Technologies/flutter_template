// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app_database.dart' as _i3;
import 'database_module.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initDatabaseGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dataBaseModule = _$DataBaseModule();
  await gh.factoryAsync<_i3.AppDatabase>(
      () => dataBaseModule.providerAppDatabase(),
      preResolve: true);
  gh.lazySingleton<_i4.DatabasePort>(() =>
      dataBaseModule.providerAppPersistentAdapter(get<_i3.AppDatabase>()));
  return get;
}

class _$DataBaseModule extends _i5.DataBaseModule {}
