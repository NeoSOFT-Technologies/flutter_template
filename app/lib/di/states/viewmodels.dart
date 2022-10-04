import 'package:app/feature/dashboard/dashboard_page_model.dart';
import 'package:app/feature/splash/splash_page_model.dart';
import 'package:app/feature/tabs/navigation/navigation_page_model.dart';
import 'package:app/feature/tabs/profile/profile_page_model.dart';
import 'package:app/feature/tabs/search/search_page_model.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dependencies.dart';
import '../../feature/dashboard/bottom_navigation_viewmodel.dart';
import '../../feature/tabs/home/home_page_model.dart';

final splashViewModelProvider =
    ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) => SplashViewModel(getIt.get<String>(instanceName: "BaseUrl"),
      getIt.get<FlutterExceptionHandlerBinder>()),
);

final homeViewModelProvider =
ChangeNotifierProvider.autoDispose<HomePageViewModel>(
        (ref) => HomePageViewModel(),
);

final navigationViewModelProvider =
ChangeNotifierProvider.autoDispose<NavigationViewModel>(
        (ref) => NavigationViewModel(),
);

final profileViewModelProvider =
ChangeNotifierProvider.autoDispose<ProfileViewModel>(
        (ref) => ProfileViewModel(),
);

final searchViewModelProvider =
ChangeNotifierProvider.autoDispose<SearchViewModel>(
        (ref) => SearchViewModel(),
);

final dashboardViewModelProvider =
ChangeNotifierProvider.autoDispose<DashboardViewModel>(
        (ref) => DashboardViewModel(),
);


final bottomNavigationViewModelProvider =
ChangeNotifierProvider.autoDispose<BottomNavigationViewModel>(
        (ref) => BottomNavigationViewModel(),
);