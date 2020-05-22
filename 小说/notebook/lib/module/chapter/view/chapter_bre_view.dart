import 'package:flutter/material.dart';

class ChapterBreView extends StatelessWidget {
  const ChapterBreView({
    Key key,
    @required this.content,
  }) : super(key: key);
  final String content;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
            top: 10,
          ),
          child: Text(
            content,
            strutStyle: StrutStyle(
              forceStrutHeight: true,
              height: 1.8,
            ),
          ),
        ),
      ),
    );
  }
}
