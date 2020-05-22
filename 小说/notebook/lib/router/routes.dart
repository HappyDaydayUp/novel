import 'package:fluro/fluro.dart';
import 'package:notebook/router/route_handlers.dart';

class Routes {
  static String root = '/';
  static String chapter = '/chapter';
  static void configRoutes(Router router) {
    router.define(root, handler: homeHandler);
    router.define(chapter, handler: chapterHandler);
  }
}
