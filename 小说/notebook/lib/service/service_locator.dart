import 'package:get_it/get_it.dart';
import 'package:notebook/module/home/view_model/home_view_model.dart';
import 'package:notebook/service/home_service.dart';

GetIt serviceLocator = GetIt.instance;

// 这个地方把service 注册
void setUpServiceLocator() {
  serviceLocator.registerLazySingleton<HomeService>(() => HomeService());
  serviceLocator.registerFactory(() => HomeViewModel());
}
