import 'package:flutter/material.dart';

class ChapterSelector extends StatelessWidget {
  const ChapterSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = 44.0;
    var radio = 4.0;
    return SliverToBoxAdapter(
      child: Material(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 15,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: height,
                  child: RaisedButton(
                    elevation: 0.5,
                    color: Colors.white,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radio),
                    ),
                    child: Text('加入书架'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: height,
                  child: RaisedButton(
                    elevation: 0.9,
                    color: Colors.deepOrangeAccent,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radio),
                    ),
                    child: Text(
                      '继续阅读',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: height,
                  child: RaisedButton(
                    elevation: 0.5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radio),
                    ),
                    onPressed: () {},
                    child: Container(
                      child: Text('离线下载'),
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
