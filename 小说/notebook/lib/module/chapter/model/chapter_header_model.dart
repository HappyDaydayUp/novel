import 'package:flutter/material.dart';

import 'chapter_model.dart';

class ChapterHeaderModel {
  ChapterHeaderModel({
    @required this.newestChapterInfo,
    @required this.noveBrefInfo,
  });

  final NewestChapterInfo newestChapterInfo;
  final NoveBrefInfo noveBrefInfo;
}
