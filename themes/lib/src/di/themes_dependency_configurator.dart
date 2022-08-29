import 'package:dependency_injection/dependency_injection.dart';
import 'themes_dependency_configurator.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

//global private function
@InjectableInit(initializerName: r'$initThemeGetIt')
Future _configureModuleDependencies(GetIt getIt) => $initThemeGetIt(getIt);

//module config
class ThemesDependencyConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return _configureModuleDependencies(getIt);
  }
}
