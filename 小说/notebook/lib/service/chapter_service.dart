import 'package:flutter/material.dart';
import 'package:notebook/model/novel_model.dart';
import 'package:notebook/module/chapter/model/chapter_model.dart';
import 'package:notebook/service/service.dart';
import 'package:html/parser.dart' as Parse;
import 'package:html/dom.dart' as Dom;

class ChapterService extends Service {
  Future<ChapterModel> loadData(String url) async {
    debugPrint('url===ChapterService===>$url');
    var response = await dio.get(url);
    String htmlText = response.data;
    return _parse(htmlText);
  }

  ChapterModel _parse(String html) {
    final htmlData = Parse.parse(html);
    // 简介
    //  final brefIntroData = htmlData.getElementsByClassName('box_con').first;
    // 章节列表
    final chapterInfo = _parseChapterBrefIntr(htmlData);

    debugPrint('chapterInfo======>>>${chapterInfo.one.noveItem.imageURL}');
    debugPrint('chapterInfo======>>>${chapterInfo.one.noveItem.name}');

    final chapterListData = htmlData.getElementById('list');
    final chapters = _parseChapterListe(chapterListData);
    debugPrint('chapters========>>>${chapters.length}');
    return ChapterModel(
      chapterList: chapters,
      introNoveList: chapterInfo.three,
      newestChapterInfo: chapterInfo.two,
      noveBrefInfo: chapterInfo.one,
    );
  }

  // 解析详情
  NoveThreeTrup<NoveBrefInfo, NewestChapterInfo, List<NoveItem>>
      _parseChapterBrefIntr(Dom.Document document) {
    // 这个是图片的
    final noveImageElenment =
        document.getElementById('fmimg').getElementsByTagName('img').first;
    final imageURL = noveImageElenment.attributes['src'];
    final width = noveImageElenment.attributes['width'];
    final height = noveImageElenment.attributes['height'];
    // 这个地方详细介绍的
    final noveInfoEle = document.getElementById('info');
    final noveName = noveInfoEle.getElementsByTagName('h1').first.text;
    //作    者：耳根
    final noveEles = noveInfoEle.getElementsByTagName('p');
    final noveAuthor = noveEles.first.text;
    final brefText =
        document.getElementById('intro').getElementsByTagName('p').last.text;

    final noveItem = NoveItem(
      name: noveName,
      author: noveAuthor,
      imageURL: imageURL,
    );

    final brefInfo = NoveBrefInfo(
      brefIntroText: brefText,
      noveItem: noveItem,
      imgHeigth: height,
      imgWidth: width,
    );

    NewestChapterInfo info;

    // 更新
    if (noveAuthor.length > 3) {
      final noveUpdate = noveEles[2].text;
      final newestChapterEle = noveEles[3].getElementsByTagName('a').first;
      final newestChapterName = newestChapterEle.text;
      final newestChapterURL = newestChapterEle.attributes['href'];
      final newestChapterItem = ChapterItem(
        name: newestChapterName,
        urlText: newestChapterURL,
      );
      // 最新章节
      final newestInfo = NewestChapterInfo(
        chapterItem: newestChapterItem,
        updateTime: noveUpdate,
      );
      info = newestInfo;
    }

    final commentDatas =
        document.getElementById('listtj').getElementsByTagName('a').map((item) {
      final noveName = item.text;
      final noveURL = item.attributes['href'];
      final noveItem = NoveItem.noImageItem(
        noveName,
        'author',
        noveURL,
      );
      return noveItem;
    }).toList();

    // 这个地方就有数据了
    return NoveThreeTrup<NoveBrefInfo, NewestChapterInfo, List<NoveItem>>(
      one: brefInfo,
      two: info,
      three: commentDatas,
    );
    //NoveThreeTrup<NoveBrefInfo, NewestChapterInfo, List<NoveItem>, >();
    // 数据把
  }

  // 解析章节目录数据
  List<ChapterItem> _parseChapterListe(Dom.Element element) {
    return element.getElementsByTagName('dd').map((item) {
      final aItem = item.getElementsByTagName('a').first;
      final chapterName = aItem.text;
      final chapterURL = aItem.attributes['href'];
      return ChapterItem(
        name: chapterName,
        urlText: chapterURL,
      );
    }).toList();
  }
}
