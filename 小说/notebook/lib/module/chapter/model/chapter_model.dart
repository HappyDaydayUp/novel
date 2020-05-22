import 'package:flutter/material.dart';
import 'package:notebook/model/novel_model.dart';

class ChapterModel {
  const ChapterModel({
    @required this.chapterList,
    @required this.introNoveList,
    @required this.newestChapterInfo,
    @required this.noveBrefInfo,
  });
  final List<ChapterItem> chapterList;
  final NewestChapterInfo newestChapterInfo;
  final NoveBrefInfo noveBrefInfo;
  final List<NoveItem> introNoveList;
}

class NoveBrefInfo {
  const NoveBrefInfo({
    @required this.brefIntroText,
    @required this.noveItem,
    @required this.imgHeigth,
    @required this.imgWidth,
  });
  final NoveItem noveItem;
  final String brefIntroText;
  final String imgWidth;
  final String imgHeigth;
}

class NewestChapterInfo {
  const NewestChapterInfo({
    @required this.chapterItem,
    @required this.updateTime,
  });

  final String updateTime;
  final ChapterItem chapterItem;
}

class ChapterItem {
  const ChapterItem({
    @required this.name,
    @required this.urlText,
  });
  final String name;
  final String urlText;
  String brefName() {
    var brefName = this.name.trimRight();
    return brefName;
  }
}
