// 小说的基本模型
// 元组
import 'package:flutter/material.dart';

class NoveTwoTrup<T, Y> {
  const NoveTwoTrup({
    @required this.one,
    @required this.two,
  });
  final T one;
  final Y two;
}

class NoveThreeTrup<T, Y, U> {
  const NoveThreeTrup({
    @required this.one,
    @required this.two,
    @required this.three,
  });
  final T one;
  final Y two;
  final U three;
}

class NoveFourTrup<T, Y, U, I> {
  const NoveFourTrup({
    @required this.one,
    @required this.two,
    @required this.three,
    @required this.four,
  });
  final T one;
  final Y two;
  final U three;
  final I four;
}

class NoveItem {
  NoveItem({
    this.name,
    this.detaiURL,
    this.imageURL,
    this.author,
  });
  String name;
  String detaiURL;
  String imageURL;
  String author;

  NoveItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    detaiURL = json['detaiURL'];
    imageURL = json['imageURL'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'detaiURL': detaiURL,
      'imageURL': imageURL,
      'author': author,
    };
  }

  static NoveItem noImageItem(
    String name,
    String author,
    String detaiURL,
  ) {
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
    if (author.startsWith(name) && author.contains('/')) {
      var authors = author.split('/');
      if (authors.length > 1) {
        author = authors.last;
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
