import 'package:dependency_injection/dependency_injection.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'network_dependency_configurator.config.dart';

//global private function
@InjectableInit(initializerName: r'$initNetworkGetIt')
_configureModuleDependencies(GetIt getIt) => $initNetworkGetIt(getIt);

class NetworkDependencyConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
