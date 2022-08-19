import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:themes/themes.dart';
import 'package:database_room/database_room.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

final getIt = GetIt.instance;

// configureModulesDependencies imported from feature_module
final configurators = [

  //configure themes
  ThemesDependencyConfigurator(),

  //configure datasources
  DatabaseDependencyConfigurator(),

  //configure data layer
  DataDependencyConfigurator(),

  //configure domain layer
  DomainDependencyConfigurator(),


];

Future configureDependencies(DependencyConfigurationContext context) async {
  for (var configurator in configurators) {
    await configurator.configureDependencies(context, getIt);
  }
}
