/// Support for doing something awesome.
///
/// More dartdocs go here.
library domain;

export 'src/di/domain_dependency_configurator.dart';
export 'package:dartz/dartz.dart';

//repository contracts
export 'src/repository/user_repository.dart';
export 'src/repository/location_repository.dart';
export 'src/repository/weather_repository.dart';

//use-cases
export 'src/usecase/base/params.dart';
export 'src/usecase/user/login_usecase.dart';
export 'src/usecase/location/check_location_permission_usecase.dart';
export 'src/usecase/location/request_location_permission_usecase.dart';
export 'src/usecase/location/get_location_usecase.dart';
export 'src/usecase/weather/create_location_usecase.dart';
export 'src/usecase/weather/get_future_timeline_usecase.dart';
export 'package:shared/shared.dart';

