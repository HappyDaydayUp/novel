import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notebook/module/chapter/model/chapter_header_model.dart';

class ChapterHeaderView extends StatelessWidget {
  const ChapterHeaderView({
    Key key,
    @required this.model,
  }) : super(key: key);
  final ChapterHeaderModel model;
  @override
  Widget build(BuildContext context) {
    debugPrint(
        'this.model.noveBrefInfo.noveItem.imageURL===>${this.model.noveBrefInfo.noveItem.imageURL}');
    return SliverToBoxAdapter(
      child: Material(
        child: Container(
          height: double.parse(model.noveBrefInfo.imgHeigth) + 20,
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: double.parse(model.noveBrefInfo.imgWidth),
                child: CachedNetworkImage(
                  imageUrl: model.noveBrefInfo.noveItem.imageURL,
                  placeholder: (_, __) {
                    return FlutterLogo();
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        model.noveBrefInfo.noveItem.author,
                      ),
                      Text(
                        '最新章节：${model.newestChapterInfo.chapterItem.brefName()}',
                      ),
                      Text(
                        model.newestChapterInfo.updateTime,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
