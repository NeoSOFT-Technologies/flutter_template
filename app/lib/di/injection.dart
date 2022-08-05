import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:themes/src/di/injection.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future configureDependencies() async {

  // configureModulesDependencies imported from feature_module
  await configureThemeDependencies();

  // configure main module dependencies
  $initGetIt(getIt);
}
