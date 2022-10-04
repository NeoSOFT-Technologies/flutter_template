import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';

import '../model/alert_texts.dart';

class FlutterAlertErrorPresenter<T extends AlertTexts>
    extends AlertErrorPresenter<T> {
  FlutterAlertErrorPresenter(
      {super.alertTitle = "", super.positiveButtonText = ""});

  @override
  void show(Exception throwable, BuildContext context, AlertTexts data) {
    // your alert provider
  }
}
