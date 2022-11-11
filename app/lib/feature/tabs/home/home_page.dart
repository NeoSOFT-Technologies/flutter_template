

import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/tabs/home/home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'home_page_view.dart';

class HomePage extends BasePage<HomePageViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseStatefulPage<HomePageViewModel, HomePage> {


  @override
  void onModelReady(HomePageViewModel model) {

  }

  @override
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }


  @override
  Widget buildView(BuildContext context, HomePageViewModel model) {
    return HomePageView(provideBase());
  }

  @override
  ProviderBase<HomePageViewModel> provideBase() {
    return homeViewModelProvider;
  }
}