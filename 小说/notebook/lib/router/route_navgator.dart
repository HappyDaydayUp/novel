import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:notebook/model/novel_model.dart';
import 'package:notebook/router/application.dart';
import 'package:notebook/router/fluro_convert.dart';
import 'package:notebook/router/routes.dart';

class RouteNavgator {
  static void goChapterPage(BuildContext context, NoveItem noveItem) {
    final noveItemJson = FluroConvert.object2string<NoveItem>(noveItem);
    Application.router.navigateTo(
      context,
      Routes.chapter + '?noveItemJson=$noveItemJson',
      transition: TransitionType.cupertino,
    );
  }
}
