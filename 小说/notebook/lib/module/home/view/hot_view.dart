import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notebook/model/novel_model.dart';

class HomeHotView extends StatelessWidget {
  HomeHotView({
    Key key,
    @required this.hotData,
  }) : super(key: key) {
    if (hotData == null) {
      debugPrint('==hotData=hotData====');
    }
  }
  final List<HotNovelItemData> hotData;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: 10,
        right: 10,
        left: 10,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            var hotModel = hotData[index];
            return HomeHotItem(
              data: hotModel,
            );
          },
          childCount: hotData.length,
        ),
      ),
    );
  }
}

class HomeHotItem extends StatelessWidget {
  const HomeHotItem({
    Key key,
    this.data,
  }) : super(key: key);

  final HotNovelItemData data;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: InkWell(
        onTap: () {
          debugPrint('InkWell===InkWell==>>');
        },
        child: Container(
          // color: Colors.white,
          padding: EdgeInsets.only(top: 0, left: 5, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3),
              bottomLeft: Radius.circular(3),
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  // color: Colors.blueGrey,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data.noveItem.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data.des,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          data.noveItem.author,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        // color: Colors.blue,
                        alignment: Alignment.bottomRight,
                      ),
                    ],
                  ),
                ),
                flex: 3,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: data.noveItem.imageURL,
                      placeholder: (cont, imageUrl) {
                        return FlutterLogo();
                      },
                      fit: BoxFit.fitWidth,
                    ),
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
