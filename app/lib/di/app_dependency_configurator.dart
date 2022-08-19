import 'package:dependency_injection/dependency_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

class AppDependencyConfigurator implements DependencyConfigurator {
  @override
  @InjectableInit(initializerName: r'$initGetIt')
  Future configureDependencies(
      DependencyConfigurationContext context, GetIt getIt) {
    return Future.value($initGetIt(getIt));
  }
}
