import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/dashboard/bottom_navigation_viewmodel.dart';
import 'package:app/feature/dashboard/dashboard_page_model.dart';
import 'package:app/feature/tabs/home/home_page.dart';
import 'package:app/feature/tabs/navigation/navigation_page.dart';
import 'package:app/feature/tabs/profile/profile_page.dart';
import 'package:app/feature/tabs/search/search_page.dart';
import 'package:app/widgets/fade_indexed_stack.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

class DashboardPageView extends BasePageViewWidget<DashboardViewModel> {
  DashboardPageView(super.providerBase, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, model) {
    return BaseWidget<BottomNavigationViewModel>(
      providerBase: bottomNavigationViewModelProvider,
      builder: (BuildContext context,
          BottomNavigationViewModel? bottomNavigationViewModel,
          Widget? child) =>
          FadeIndexedStack(
            duration: const Duration(milliseconds: 500),
            index: bottomNavigationViewModel?.currentTab.toInt(),
            children: const <Widget>[
              HomePage(),
              SearchPage(),
              NavigationPage(),
              ProfilePage()
            ],
          ),
    );
  }
}