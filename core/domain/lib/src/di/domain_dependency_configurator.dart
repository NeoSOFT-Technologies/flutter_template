import 'package:dependency_injection/dependency_injection.dart';
import 'domain_dependency_configurator.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

//global private function
@InjectableInit(initializerName: r'$initDomainGetIt')
_configureModuleDependencies(GetIt getIt) => $initDomainGetIt(getIt);

class DomainDependencyConfigurator implements DependencyConfigurator {
  @override
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value(_configureModuleDependencies(getIt));
  }
}
