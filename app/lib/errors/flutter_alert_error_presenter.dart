import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';

class FlutterAlertErrorPresenter extends AlertErrorPresenter<String> {
  FlutterAlertErrorPresenter(
      {super.alertTitle = "", super.positiveButtonText = ""});

  @override
  void show(Exception throwable, BuildContext context, String data) {
    // your alert provider
  }
}
