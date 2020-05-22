import 'package:fluro/fluro.dart';
import 'package:notebook/model/novel_model.dart';
import 'package:notebook/module/chapter/page/chapter.dart';
import 'package:notebook/module/home/page/home_page.dart';
import 'package:notebook/router/fluro_convert.dart';

var homeHandler = Handler(handlerFunc: (context, parms) {
  return HomePage();
});
var chapterHandler = Handler(handlerFunc: (context, parms) {
  final String noveItemJson = parms['noveItemJson']?.first;
  NoveItem item = NoveItem.fromJson(FluroConvert.string2map(noveItemJson));
  return ChapterPager(
    data: item,
  );
});
