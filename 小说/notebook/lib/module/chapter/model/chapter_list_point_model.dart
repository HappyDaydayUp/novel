import 'package:flutter/material.dart';

class ChapterLintPointModel {
  const ChapterLintPointModel({
    @required this.chapterCounterText,
    @required this.newestUpdateTime,
    @required this.title,
  });

  final String title;
  final String chapterCounterText;
  final String newestUpdateTime;
}
