import 'package:flutter/material.dart';

class BaseViewModel<T> with ChangeNotifier {
  ViewModelTyple state;
  T model;
  void loadData() {
    change(ViewModelTyple.loading);
  }

  void change(ViewModelTyple state) {
    if (this.state != state) {
      this.state = ViewModelTyple.loading;
      notifyListeners();
    }
  }
}

enum ViewModelTyple {
  loading,
  success,
  netErr,
  dataErr,
  dataEmpty,
}
