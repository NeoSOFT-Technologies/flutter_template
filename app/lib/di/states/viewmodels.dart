import 'package:app/feature/splash/splash_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../injection.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(getIt.get<String>(instanceName: "BaseUrl")),
);
