import 'package:notebook/model/novel_model.dart';

class HomeModel {
  HomeModel({
    this.hotData,
    this.intrData,
    this.novelList,
    this.cominData,
    this.updateData,
  });

  final List<HotNovelItemData> hotData;
  final List<NewestComeinModel> intrData;
  final List<NovelSectionModel<NoveItem>> novelList;
  final List<NewestUpdateModel> updateData;
  final List<NewestComeinModel> cominData;
}
