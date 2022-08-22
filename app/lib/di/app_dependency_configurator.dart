import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_dependency_configurator.config.dart';

//global private function
@InjectableInit(initializerName: r'$initGetIt')
_configureMainDependencies(GetIt getIt) => $initGetIt(getIt);

class AppDependencyConfigurator implements DependencyConfigurator {
  @override
  @InjectableInit(initializerName: r'$initGetIt')
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureMainDependencies(getIt));
  }
}
