import 'package:app/feature/weather_detail/weather_detail_page.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart';
import 'splash_page_model.dart';
import 'splash_page_view.dart';

class SplashPage extends BasePage<SplashViewModel> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends BaseStatefulPage<SplashViewModel, SplashPage> {
  @override
  ProviderBase<SplashViewModel> provideBase() {
    return splashViewModelProvider;
  }

  @override
  void onModelReady(SplashViewModel model) {
    // bind exception handler here.
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    getViewModel().navigateToDashboard().listen((event) {
      if (event) {
        Navigator.pushReplacementNamed(
          context,
          RoutePaths.weatherDetail,
          arguments: WeatherDetailPageParam(
            Location(
              locationId: '633191078d244f330e4f238d',
              name: 'Pune',
              geometryLocation: GeometryLocation(
                type: 'Point',
                coordinates: [
                  73.856743,
                  18.520430,
                ],
              ),
            ),
          ),
        );
      }
    });
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  Widget buildView(BuildContext context, SplashViewModel model) {
    return SplashPageView(provideBase());
  }
}
