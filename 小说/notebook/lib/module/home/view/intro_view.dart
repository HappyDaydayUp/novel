import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notebook/model/novel_model.dart';
import 'package:notebook/router/route_navgator.dart';

class IntrolView extends StatelessWidget {
  IntrolView({
    Key key,
    @required this.intrData,
  }) : super(key: key);

  final List<NewestComeinModel> intrData;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      sliver: IntrSliverGidView(
        data: intrData,
      ),

      //IntrGidView(data: intrData),
    );
  }
}

class IntrSliverGidView extends StatelessWidget {
  const IntrSliverGidView({
    Key key,
    @required this.data,
  }) : super(key: key);
  final List<NewestComeinModel> data;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          NewestComeinModel model = data[index];
          return IntrGirdItem(
            model: model,
          );
        },
        childCount: data.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.53,
      ),
    );
  }
}

class IntrGirdItem extends StatelessWidget {
  IntrGirdItem({
    Key key,
    @required this.model,
  }) : super(key: key);
  final NewestComeinModel model;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          RouteNavgator.goChapterPage(
            context,
            model.noveItem,
          );
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: 5,
            top: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: model.noveItem.imageURL,
                placeholder: (_, __) {
                  return FlutterLogo();
                },
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        model.noveItem.name,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(model.typle),
                          Expanded(
                            child: Text(
                              model.noveItem.author,
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
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

class StickyPinView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      delegate: StickyTabBarDelegate(
        child: Text("data"),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  StickyTabBarDelegate({
    @required this.child,
  });
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 300;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
