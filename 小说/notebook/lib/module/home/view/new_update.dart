import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:notebook/model/novel_model.dart';
import 'package:notebook/router/route_navgator.dart';

class NewUpdateView extends StatelessWidget {
  const NewUpdateView({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<NewestUpdateModel> data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: ListView.builder(
        itemBuilder: (_, index) {
          final model = data[index];
          return NewUpdateItem(model: model);
        },
        itemCount: data.length,
      ),
    );
  }
}

class NewUpdateItem extends StatelessWidget {
  NewUpdateItem({
    Key key,
    @required this.model,
  }) : super(key: key);
  final NewestUpdateModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(4),
        elevation: .8,
        child: ListTile(
          onTap: () {
            RouteNavgator.goChapterPage(
              context,
              model.novelModel.noveItem,
            );
          },
          title: Text(
            model.novelModel.noveItem.name,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                model.chapterName,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    model.novelModel.typle,
                  ),
                  Text(
                    model.novelModel.noveItem.author,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
          ),
          leading: CachedNetworkImage(
            imageUrl: model.novelModel.noveItem.imageURL,
            placeholder: (_, __) => FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
