import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class SplashViewModel extends BasePageViewModel {
  final String myBaseUrl;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;

  SplashViewModel(@factoryParam this.myBaseUrl, this.exceptionHandlerBinder) {
    debugPrint("My First log in Splash $myBaseUrl");
  }

  void test() {
    exceptionHandlerBinder.handle(block: () {
      debugPrint("exceptionHandlerBinder start");
      throw const FormatException("Something is wrong");
      /* throw NetworkError(
          httpError: 1,
          message: "message Testing another error",
          cause: Exception("Testing another error"));*/
      /*var name = await Future.delayed(
        const Duration(seconds: 2),
        () => //"my name",
            throw const FormatException("sad"),
      );*/
      //print("name >> $name");
    }).execute();

/*
    exceptionHandlerBinder.handle(block: () {
      // serverRequest(); // Some dangerous code that can throw an exception
    }).finallyIt(block: () {
      // Optional finally block
      // Some code
    }).execute();
*/

   /* exceptionHandlerBinder.handle(block: () {
      // serverRequest(); // Some dangerous code that can throw an exception
    }).catchIt<FormatException>((e) {
      // Optional finally block
      // Some code
      return false;
    }).execute();*/
  }
}
