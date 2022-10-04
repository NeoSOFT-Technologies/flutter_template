import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/dashboard/dashboard_page_view.dart';
import 'package:app/feature/dashboard/dashboard_page_view_model.dart';

class DashboardPage extends BasePage<DashboardPageViewModel> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends BaseStatefulPage<DashboardPageViewModel, DashboardPage> {
  @override
  ProviderBase provideBase() {
    return dashboardViewModelProvider;
  }

  @override
  void onModelReady(DashboardPageViewModel model) {
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
    model.createLocation(
      name: 'Pune',
      lat:10.1 ,
      lan: 125.6,
    );
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  Widget buildView(BuildContext context, DashboardPageViewModel model) {
    return DashboardPageView(provideBase());
  }
}
