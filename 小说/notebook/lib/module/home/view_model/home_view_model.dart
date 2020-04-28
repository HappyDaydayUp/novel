import 'package:flutter/material.dart';
import 'package:notebook/base/view_model.dart';
import 'package:notebook/module/home/model/home_model.dart';
import 'package:notebook/service/home_service.dart';
import 'package:notebook/service/service_locator.dart';

class HomeViewModel extends BaseViewModel with ChangeNotifier {
  HomeModel model;
  HomeService _homeService = serviceLocator<HomeService>();

  void loadData() async {
    change(ViewModelTyple.loading);
    try {
      model = await _homeService.getData();
      this.state = ViewModelTyple.success;
      notifyListeners();
    } catch (e) {
      this.state = ViewModelTyple.dataEmpty;
      notifyListeners();
    }
  }

  void change(ViewModelTyple state) {
    if (this.state != state) {
      this.state = ViewModelTyple.loading;
      notifyListeners();
    }
  }
}
