import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notebook/module/chapter/view_model/chapter_view_model.dart';
import 'package:notebook/module/home/view_model/home_view_model.dart';
import 'package:notebook/service/chapter_service.dart';
import 'package:notebook/service/home_service.dart';

GetIt serviceLocator = GetIt.instance;

// 这个地方把service 注册
void setUpServiceLocator() {
  serviceLocator.registerLazySingleton<HomeService>(
    () => HomeService(),
  );
  serviceLocator.registerLazySingleton<ChapterService>(
    () => ChapterService(),
  );

  serviceLocator
      .registerFactoryParam<ChapterViewModel, String, String>((p1, p2) {
    debugPrint('p======$p1=======>$p2');
    return ChapterViewModel(
      url: p1,
    );
  });
  serviceLocator.registerFactory(
    () => HomeViewModel(),
  );
}
