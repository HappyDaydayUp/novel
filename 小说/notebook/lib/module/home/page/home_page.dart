import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notebook/base/page_view.dart';
import 'package:notebook/module/home/view/hot_view.dart';
import 'package:notebook/module/home/view/intro_view.dart';
import 'package:notebook/module/home/view/new_come_view.dart';
import 'package:notebook/module/home/view/new_update.dart';
import 'package:notebook/module/home/view/novel_section_view.dart';
import 'package:notebook/module/home/view_model/home_view_model.dart';
import 'package:notebook/service/service_locator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  HomeViewModel _viewModel = serviceLocator<HomeViewModel>();
  TabController _tabController;
  void initState() {
    super.initState();
    _viewModel.loadData();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(text: '首页'),
            Tab(text: '最新更新'),
            Tab(text: '最新上架'),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ChangeNotifierProvider(
            create: (context) => _viewModel,
            child: Consumer<HomeViewModel>(builder:
                (BuildContext context, HomeViewModel viewModel, Widget child) {
              debugPrint(
                  '=model.hotData.length============${viewModel.state}>');

              return BasePageView(
                typle: viewModel.state,
                buildCallback: (context) => Container(
                  child: TabBarView(controller: _tabController, children: [
                    CustomScrollView(
                      slivers: <Widget>[
                        HomeHotView(hotData: viewModel.model.hotData),
                        IntrolView(intrData: viewModel.model.intrData),
                        NovelSctionView(dataList: viewModel.model.novelList),
                      ],
                    ),
                    NewUpdateView(data: viewModel.model.updateData),
                    NewComeInView(data: viewModel.model.cominData),
                  ]),
                ),
                callback: () {},
              );

/*
              if (viewModel.loading) {
                return Center(
                  child: CupertinoActivityIndicator(
                    animating: true,
                  ),
                );
              }
              return Container(
                child: TabBarView(controller: _tabController, children: [
                  CustomScrollView(
                    slivers: <Widget>[
                      HomeHotView(hotData: viewModel.model.hotData),
                      IntrolView(intrData: viewModel.model.intrData),
                      NovelSctionView(dataList: viewModel.model.novelList),
                    ],
                  ),
                  NewUpdateView(data: viewModel.model.updateData),
                  NewComeInView(data: viewModel.model.cominData),
                ]),
              );
              */
            }),
          ),
        ),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  StickyTabBarDelegate({
    @required this.child,
  });
  final TabBar child;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
