import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastErrorPresenter<T extends String> extends ToastErrorPresenter<T> {
  @override
  void show(Exception throwable, BuildContext context, String data) {
    Fluttertoast.showToast(
        msg: data,
        toastLength: super.duration.toFlutter(),
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

extension on ToastDuration {
  Toast toFlutter() {
    switch (this) {
      case ToastDuration.short:
        return Toast.LENGTH_SHORT;
      case ToastDuration.long:
        return Toast.LENGTH_LONG;
    }
  }
}
