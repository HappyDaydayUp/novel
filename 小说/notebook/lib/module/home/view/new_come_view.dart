import 'package:flutter/material.dart';
import 'package:notebook/model/novel_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:notebook/router/route_navgator.dart';

class NewComeInView extends StatelessWidget {
  const NewComeInView({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<NewestComeinModel> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          //return NewestComeinModel();
          return NewConInItem(model: data[index]);
        },
        itemCount: data.length,
      ),
    );
  }
}

class NewConInItem extends StatelessWidget {
  const NewConInItem({
    Key key,
    @required this.model,
  }) : super(key: key);
  final NewestComeinModel model;
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
              model.noveItem,
            );
          },
          title: Text(
            model.noveItem.name,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    model.typle,
                  ),
                  Text(
                    model.noveItem.author,
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
            imageUrl: model.noveItem.imageURL,
            placeholder: (_, __) {
              return FlutterLogo();
            },
          ),
        ),
      ),
    );
  }
}
