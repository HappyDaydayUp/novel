import 'package:flutter/material.dart';
import 'package:notebook/base/page_view.dart';
import 'package:notebook/model/novel_model.dart';
import 'package:notebook/module/chapter/model/chapter_header_model.dart';
import 'package:notebook/module/chapter/view/chapter_bre_view.dart';
import 'package:notebook/module/chapter/view/chapter_intro_list.dart';
import 'package:notebook/module/chapter/view/chapter_list_point.dart';
import 'package:notebook/module/chapter/view/chapter_selector_view.dart';
import 'package:notebook/module/chapter/view/chapter_view.dart';
import 'package:notebook/module/chapter/view_model/chapter_view_model.dart';
import 'package:notebook/service/service_locator.dart';
import 'package:provider/provider.dart';

class ChapterPager extends StatefulWidget {
  ChapterPager({
    Key key,
    @required this.data,
  }) : super(key: key);
  final NoveItem data;
  @override
  _ChapterPagerState createState() => _ChapterPagerState();
}

class _ChapterPagerState extends State<ChapterPager> {
  ChapterViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = serviceLocator.get<ChapterViewModel>(
      param1: widget.data.detaiURL,
    );
    _viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data.name,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: ChangeNotifierProvider(
            create: (context) => _viewModel,
            child: Consumer<ChapterViewModel>(
                builder: (context, viewModel, child) {
              return BasePageView(
                typle: viewModel.state,
                buildCallback: (context) {
                  ChapterHeaderModel headerModel = ChapterHeaderModel(
                    newestChapterInfo: viewModel.model.newestChapterInfo,
                    noveBrefInfo: viewModel.model.noveBrefInfo,
                  );
                  return Container(
                    color: Colors.white,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        ChapterHeaderView(
                          model: headerModel,
                        ),
                        ChapterSelector(),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        ChapterBreView(
                          content: viewModel.model.noveBrefInfo.brefIntroText,
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        ChapterListPointView(
                          model: viewModel.lintPointModel,
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        ChapterIntroListView(
                          model: viewModel.model.introNoveList,
                        ),
                      ],
                    ),
                  );
                },
                callback: () {},
              );
            }),
          ),
        ),
      ),
    );
  }
}
