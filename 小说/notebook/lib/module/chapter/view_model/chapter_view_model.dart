import 'package:flutter/material.dart';
import 'package:notebook/base/view_model.dart';
import 'package:notebook/module/chapter/model/chapter_list_point_model.dart';
import 'package:notebook/module/chapter/model/chapter_model.dart';
import 'package:notebook/service/chapter_service.dart';
import 'package:notebook/service/service_locator.dart';

class ChapterViewModel extends BaseViewModel<ChapterModel> {
  ChapterViewModel({
    @required this.url,
  }) : super();
  final String url;
  ChapterModel model;
  ChapterService _service = serviceLocator.get<ChapterService>();
  ChapterLintPointModel lintPointModel;
  @override
  void loadData() async {
    super.loadData();
    try {
      this.model = await _service.loadData(url);
      final summonChapterCounter = '共${model.chapterList.length}章';
      final newestUpdateTime = '最新更新于1010';
      final title = '查看目录';
      lintPointModel = ChapterLintPointModel(
        chapterCounterText: summonChapterCounter,
        newestUpdateTime: newestUpdateTime,
        title: title,
      );
      this.state = ViewModelTyple.success;
      notifyListeners();
    } catch (e) {
      this.state = ViewModelTyple.dataErr;
      notifyListeners();
    }
  }
}
