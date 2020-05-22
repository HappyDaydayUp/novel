import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notebook/model/novel_model.dart';
import 'package:notebook/router/route_navgator.dart';

class ChapterIntroListView extends StatelessWidget {
  const ChapterIntroListView({
    Key key,
    @required this.model,
  }) : super(key: key);
  final List<NoveItem> model;
  @override
  Widget build(BuildContext context) {
    final width =
        (MediaQuery.of(context).size.width - 10 - 10 - 10 - 10 - 3 * 5 * 2) /
                3.0 -
            1;
    return SliverToBoxAdapter(
      child: Material(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '其他人还看过',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 30,
                children: model.map((item) {
                  return InkWell(
                    onTap: () {
                      debugPrint('=====>>>');

                      RouteNavgator.goChapterPage(
                        context,
                        item,
                      );
                    },
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                      ),
                      elevation: .8,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        // color: Colors.redAccent,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: width,
                              child: AspectRatio(
                                aspectRatio: 4.0 / 5.0,
                                child: CachedNetworkImage(
                                  imageUrl: item.imageURL,
                                  placeholder: (_, __) {
                                    return FlutterLogo();
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(item.name)
                            // Text('牧神记')
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
