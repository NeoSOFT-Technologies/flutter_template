import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/tabs/navigation/navigation_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'navigation_page_model.dart';

class NavigationPage extends BasePage<NavigationViewModel> {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends BaseStatefulPage<NavigationViewModel, NavigationPage> {

  @override
  Widget buildView(BuildContext context, NavigationViewModel model) {
    return NavigationPageView(provideBase());
  }

  @override
  ProviderBase<NavigationViewModel> provideBase() {
    return navigationViewModelProvider;
  }
}