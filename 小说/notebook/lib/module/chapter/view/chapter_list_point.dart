import 'package:flutter/material.dart';
import 'package:notebook/module/chapter/model/chapter_list_point_model.dart';

class ChapterListPointView extends StatelessWidget {
  const ChapterListPointView({
    Key key,
    @required this.model,
  }) : super(key: key);

  final ChapterLintPointModel model;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        elevation: .8,
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          height: 50,
          child: Row(
            children: <Widget>[
              Text(
                model.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                model.chapterCounterText,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Spacer(),
              Text(
                model.newestUpdateTime,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
