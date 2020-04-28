// 小说的基本模型
import 'package:flutter/material.dart';

class NoveItem {
  NoveItem({
    this.name,
    this.detaiURL,
    this.imageURL,
    this.author,
  });
  final String name;
  final String detaiURL;
  final String imageURL;
  String author;

  static NoveItem noImageItem(
    String name,
    String author,
    String detaiURL,
  ) {
    debugPrint('name=====>>>$name');
    debugPrint('author=====>>>$author');

    var imageItem = '';
    var mainURL = 'http://www.xbiquge.la/';
    if (detaiURL.startsWith(mainURL)) {
      var detaiIDString = detaiURL.substring(mainURL.length);
      var detaiIDStrings = detaiIDString.split('/')..remove('');
      var detaiID = detaiIDStrings.last;
      //  var zhangJieID = detaiIDStrings.first;

      var lastImage = 's.jpg';
      var imageURL = mainURL +
          'files/article/image/' +
          detaiIDString +
          detaiID +
          lastImage;
      imageItem = imageURL;
    }
    //flutter: author=====>>>终极斗罗/唐家三少
    //flutter: name=====>>>终极斗罗
    // var newAuthor = author;
    if (author.startsWith(name) && author.contains('/')) {
      var authors = author.split('/');
      if (authors.length > 1) {
        author = authors.last;
        debugPrint('author===KKK=====$author');
      }
    }
    if (author == null) {
      author = 'author';
    }

    return NoveItem(
      name: name,
      author: author,
      detaiURL: detaiURL,
      imageURL: imageItem,
    );
  }
}

// 热门小说
class HotNovelItemData {
  HotNovelItemData({
    this.noveItem,
    this.des,
  });
  final NoveItem noveItem;
  final String des;
}

// 各种不同类型小说的数据
class NovelSectionModel<E> {
  NovelSectionModel({
    this.sctionText,
    this.list,
  });
  final String sctionText;
  final List<E> list;
}

// 最新入库的小说
class NewestComeinModel {
  NewestComeinModel({
    this.noveItem,
    this.typle,
  });
  final NoveItem noveItem;
  final String typle;
}

// 最新更新的小说
class NewestUpdateModel {
  NewestUpdateModel({
    this.novelModel,
    this.chapterName,
    this.chapterURL,
  });
  final NewestComeinModel novelModel;
  final String chapterName;
  final String chapterURL;
}
