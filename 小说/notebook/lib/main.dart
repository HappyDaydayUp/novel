import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:notebook/router/application.dart';
import 'package:notebook/router/routes.dart';
import 'package:notebook/service/service_locator.dart';

void main() {
  final router = Router();
  Routes.configRoutes(router);
  Application.router = router;
  setUpServiceLocator();
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}
