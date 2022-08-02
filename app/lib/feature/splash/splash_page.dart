import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import '../../di/states/viewmodels.dart';
import 'splash_page_model.dart';
import 'splash_page_view.dart';

class SplashPage extends BasePage<SplashViewModel> {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends BaseStatefulPage<SplashViewModel, SplashPage> {
  @override
  ProviderBase provideBase() {
    return splashViewModelProvider;
  }

  @override
  void onModelReady(SplashViewModel model) {}

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  Widget buildView(BuildContext context, SplashViewModel model) {
    return SplashPageView(provideBase());
  }
}
