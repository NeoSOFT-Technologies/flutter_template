import 'package:flutter/material.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel extends BasePageViewModel {
  final String myBaseUrl;

  SplashViewModel(@factoryParam this.myBaseUrl) {
    debugPrint("My First log in Splash $myBaseUrl");
  }
}
