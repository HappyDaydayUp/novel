// 首页获得数据并且解析数据
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as Dom;
import 'package:notebook/model/novel_model.dart';
import 'package:notebook/module/home/model/home_model.dart';

class HomeService {
  //http://www.xbiquge.la/
  var dio = Dio(
    BaseOptions(
      headers: {
        HttpHeaders.acceptHeader:
            'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
        HttpHeaders.userAgentHeader:
            'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36',
      },
    ),
  );

  Future<HomeModel> getData() async {
    // 这个地方需要增加错误处理
    // 网络发生错误的情况
    // 先要判断有没有网络情况

    // try {

    // } catch (e) {

    // }

    var homeUrl = 'http://www.xbiquge.la/';
    var response = await dio.get(
      homeUrl,
    );
    String responseData = response.data;

    return _parseHtmlData(responseData);
  }

  // 数据解析
  HomeModel _parseHtmlData(String data) {
    var parseData = parse(data);
    // 获得热点 数据
    var hotElement = _getHotContentElent(parseData);
    var hotData = _parseHotContent(hotElement);
    // 推荐数据
    var intrData = _parseTuiJianData(hotElement);

    // 小说类型的数据
    var novelList = _parseNovelsList(parseData);

    var newsEle = _parseNewestNoveEle(parseData);

    // 最新更新的小说
    var updateData = _parseNewestUpdateData(newsEle);

    // 最新入库小说
    var cominData = _paseNewestCominData(newsEle);
    return HomeModel(
      hotData: hotData,
      intrData: intrData,
      novelList: novelList,
      updateData: updateData,
      cominData: cominData,
    );
  }

  Dom.Element _getHotContentElent(Dom.Document parseData) {
    var hotContent = 'hotcontent';
    var hotContentNode = parseData.getElementById(hotContent);
    return hotContentNode;
  }

  // 解析 hotcontent 数据
  List<HotNovelItemData> _parseHotContent(Dom.Element element) {
    var hotContentItems = element
        .getElementsByClassName('l')
        .first
        .getElementsByClassName('item');
    // 最热的数据
    return hotContentItems.map((item) {
      return _parseNovelsItemsData(item);
    }).toList();
  }

  List<NewestComeinModel> _parseTuiJianData(Dom.Element element) {
    var tuiJian = element
        .getElementsByClassName('r')
        .first
        .getElementsByTagName('ul')
        .last
        .getElementsByTagName('li');

    return tuiJian.map((item) {
      return _parseTuiJianItem(item);
    }).toList();
  }

  // 解析推荐的数据
  NewestComeinModel _parseTuiJianItem(Dom.Element item) {
    var typle = item.getElementsByClassName('s1').first.text;
    var nameE = item.getElementsByClassName('s2').first;
    var author = item.getElementsByClassName('s5').first.text;
    var nameText = nameE.text;
    var detailURL = nameE.getElementsByTagName('a').first.attributes['href'];

    return NewestComeinModel(
        typle: typle,
        noveItem: NoveItem.noImageItem(
          nameText,
          author,
          detailURL,
        ));
  }

  // 解析小说类型的列表的数据
  List<NovelSectionModel<NoveItem>> _parseNovelsList(Dom.Document document) {
    var novelsListClass = 'novelslist';
    var noveList = document.getElementsByClassName(novelsListClass);
    List<NovelSectionModel<NoveItem>> list = [];
    noveList.forEach((item) {
      var items = _parseNovelsListContent(item);
      list.addAll(items);
    });
    return list;
  }

  // 解析最新的小说列表
  Dom.Element _parseNewestNoveEle(Dom.Document document) {
    return document.getElementById('newscontent');
  }

  List<NewestUpdateModel> _parseNewestUpdateData(Dom.Element element) {
    var update = element.getElementsByClassName('l').first;
    return _parseNewestUpdate(update);
  }

  List<NewestComeinModel> _paseNewestCominData(Dom.Element element) {
    var comeIn = element.getElementsByClassName('r').first;
    return _parseNewestIn(comeIn);
  }

  // 解析最新的小说列表
  List<NewestUpdateModel> _parseNewestUpdate(Dom.Element element) {
    return element
        .getElementsByTagName('ul')
        .first
        .getElementsByTagName('li')
        .map((item) {
      var typle = item.getElementsByClassName('s1').first.text;
      var nameNode = item
          .getElementsByClassName('s2')
          .first
          .getElementsByTagName('a')
          .first;
      var name = nameNode.text;
      var nameURL = nameNode.attributes['href'];
      var author = item.getElementsByClassName('s4').first.text;
      var zhangNode = item
          .getElementsByClassName('s3')
          .first
          .getElementsByTagName('a')
          .first;
      var zhangNodeText = zhangNode.text;
      var zhangNodeURL = zhangNode.attributes['href'];
      NoveItem noveItem = NoveItem.noImageItem(
        name,
        author,
        nameURL,
      );
      var comeIn = NewestComeinModel(
        typle: typle,
        noveItem: noveItem,
      );
      return NewestUpdateModel(
        chapterName: zhangNodeText,
        chapterURL: zhangNodeURL,
        novelModel: comeIn,
      );
    }).toList();
  }

  // 解析最新入库小说
  List<NewestComeinModel> _parseNewestIn(Dom.Element element) {
    return element.getElementsByTagName('li').map((item) {
      var typle = item.getElementsByClassName('s1').first.text;
      var author = item.getElementsByClassName('s5').first.text;
      var nameNode = item
          .getElementsByClassName('s2')
          .first
          .getElementsByTagName('a')
          .first;
      var name = nameNode.text;
      var detailURL = nameNode.attributes['href'];
      var noveItem = NoveItem.noImageItem(
        name,
        author,
        detailURL,
      );
      return NewestComeinModel(
        typle: typle,
        noveItem: noveItem,
      );
    }).toList();
  }

  List<NovelSectionModel<NoveItem>> _parseNovelsListContent(
      Dom.Element contentItem) {
    var contents = contentItem.getElementsByClassName('content');
    return contents.map((item) {
      return _parseNovelsListContentItem(item);
    }).toList();
  }

  // 解析 content 下面的数据
  NovelSectionModel<NoveItem> _parseNovelsListContentItem(
      Dom.Element contentItem) {
    final String scetionName =
        contentItem.getElementsByTagName('h2').first.text;
    // debugPrint('scetionName=====>$scetionName');
    var top = contentItem.getElementsByClassName('top').first;
    var topModel = _parseNovelsItemsData(top);
    var list = _parseSectionList(contentItem);
    // list.add(topModel.noveItem);
    list.insert(0, topModel.noveItem);
    return NovelSectionModel(
      sctionText: scetionName,
      list: list,
    );
  }

  // 解析专题下面的list
  List<NoveItem> _parseSectionList(Dom.Element contentItem) {
    var liLists = contentItem.getElementsByTagName('li');
    return liLists.map((item) {
      var text = item.text;
      var aItem = item.getElementsByTagName('a').first;
      var aText = aItem.text;
      var detaiURL = aItem.attributes['href'];
      return NoveItem.noImageItem(aText, text, detaiURL);
    }).toList();
  }

  // 解析 image author des 数据
  HotNovelItemData _parseNovelsItemsData(Dom.Element item) {
    final String imageUrlString = item
        .getElementsByTagName('img')
        .first
        .attributes['src']
        .trim()
        .toString();
    var bookTag = item.getElementsByTagName('dl').first;
    var bookDes = bookTag.getElementsByTagName('dt').first;
    var bookName = bookDes.getElementsByTagName('a').first.text;
    var bookAuthors = bookDes.getElementsByTagName('span');

    var des = bookTag.getElementsByTagName('dd').first.text;
    var detailURL = item.getElementsByTagName('a').first.attributes['href'];
    var noveItem = NoveItem(
      name: bookName,
      imageURL: imageUrlString,
      detaiURL: detailURL,
    );
    if (bookAuthors.length > 0) {
      var bookAuthor = bookAuthors.first.text;
      noveItem.author = bookAuthor;
    }
    return HotNovelItemData(
      noveItem: noveItem,
      des: des,
    );
  }
}
