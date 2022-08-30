import 'package:dependency_injection/dependency_injection.dart';
import 'app_dependency_configurator.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

//global private function
@InjectableInit(initializerName: r'$initGetIt')
_configureMainDependencies(GetIt getIt) => $initGetIt(getIt);

class AppDependencyConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureMainDependencies(getIt));
  }
}
