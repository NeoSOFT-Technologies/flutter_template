import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel extends BasePageViewModel {
  final String myBaseUrl;

  SplashViewModel(@factoryParam this.myBaseUrl) {
    print("My First log in Splash $myBaseUrl");
  }
}
