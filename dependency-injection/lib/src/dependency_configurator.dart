// dependency_configurator.dart
import 'dependency_configuration_context.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyConfigurator {
  Future configureDependencies(
    DependencyConfigurationContext context,
    GetIt getIt,
  );
}
