import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notebook/model/novel_model.dart';

class NovelSctionView extends StatelessWidget {
  const NovelSctionView({
    Key key,
    @required this.dataList,
  }) : super(key: key);

  final List<NovelSectionModel<NoveItem>> dataList;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return NovelSectionItemView(
              model: dataList[index],
            );
          },
          childCount: dataList.length,
        ),
      ),
    );
  }
}

class NovelSectionItemView extends StatelessWidget {
  const NovelSectionItemView({
    Key key,
    @required this.model,
  }) : super(key: key);
  final NovelSectionModel<NoveItem> model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        // color: Colors.grey[200],
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      child: Material(
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5, top: 5),
              child: Text(
                model.sctionText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
                top: 10,
                bottom: 5,
              ),
              height: MediaQuery.of(context).size.width / 4.0 + 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return NovelItemView(model: model.list[index]);
                },
                itemCount: model.list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NovelItemView extends StatelessWidget {
  const NovelItemView({
    Key key,
    @required this.model,
  }) : super(key: key);
  final NoveItem model;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 4.0;
    return Container(
      margin: EdgeInsets.only(left: 10),
      // color: Colors.blueAccent,
      width: width,
      child: FlatButton(
        onPressed: () {
          debugPrint('FlatButton===>>');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              child: Container(
                constraints: BoxConstraints(minHeight: 130),
                child: CachedNetworkImage(
                  imageUrl: model.imageURL,
                  placeholder: (_, __) {
                    return FlutterLogo();
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  model.name,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
