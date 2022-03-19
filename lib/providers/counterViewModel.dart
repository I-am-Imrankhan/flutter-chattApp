import 'package:flutter/material.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class CounterViewModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void inCrementCounter() {
    _counter = _counter + 1;
    notifyListeners();
  }

  void setToNull() {
    _counter = 0;
    notifyListeners();
  }

  void incrementCounterbyTow() {
    _counter = _counter - 2;
    notifyListeners();
  }

  
  
}
