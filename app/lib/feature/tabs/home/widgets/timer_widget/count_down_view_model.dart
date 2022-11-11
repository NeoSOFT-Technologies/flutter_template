import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class CountDownViewModel extends BasePageViewModel {

  CountDownViewModel(this._currentDuration);

  Timer? _countdownTimer;

  Timer? get countdownTimer => _countdownTimer;

  set countdownTimer(Timer? value) {
    _countdownTimer = value;
    notifyListeners();
  }
  
  Duration _currentDuration;

  Duration get currentDuration => _currentDuration;

  set currentDuration(Duration value) {
    _currentDuration = value;
    timerController.sink.add(value);
    /*notifyListeners();*/
  }

  final PublishSubject<Duration> timerController = PublishSubject<Duration>();


  void startTimer() {
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = currentDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      currentDuration = Duration(seconds: seconds);
    }
  }

  @override
  void dispose() {
    timerController.close();
    super.dispose();
  }
}
