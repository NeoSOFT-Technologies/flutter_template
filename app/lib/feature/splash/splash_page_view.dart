import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

import 'splash_page_model.dart';

class SplashPageView extends BasePageViewWidget<SplashViewModel> {
  SplashPageView(ProviderBase<SplashViewModel> model, {Key? key}) : super(key: key, model);

  @override
  Widget build(BuildContext context, model) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.grey,
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: ElevatedButton(

            onPressed: () {
              model.test();
            },
            child: const Text("test me"),
          ),
        ),
      ),
    );
  }
}
