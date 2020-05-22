import 'package:notebook/base/view_model.dart';
import 'package:notebook/module/home/model/home_model.dart';
import 'package:notebook/service/home_service.dart';
import 'package:notebook/service/service_locator.dart';

class HomeViewModel extends BaseViewModel<HomeModel> {
  HomeModel model;
  HomeService _homeService = serviceLocator<HomeService>();

  void loadData() async {
    super.loadData();
    try {
      model = await _homeService.getData();
      this.state = ViewModelTyple.success;
      notifyListeners();
    } catch (e) {
      this.state = ViewModelTyple.dataEmpty;
      notifyListeners();
    }
  }
}
