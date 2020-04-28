import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notebook/base/view_model.dart';

typedef Widget BuildCallback(BuildContext context);

class BasePageView extends StatelessWidget {
  const BasePageView({
    Key key,
    @required this.typle,
    @required this.buildCallback,
    @required this.callback,
  }) : super(key: key);
  final ViewModelTyple typle;
  final BuildCallback buildCallback;
  final VoidCallback callback;

  Widget _errWidget(ViewModelTyple typle) {
    return RaisedButton.icon(
      onPressed: this.callback,
      icon: Icon(Icons.error_outline),
      label: Text('发生错误'),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (typle) {
      case ViewModelTyple.loading:
        child = Center(
          child: CupertinoActivityIndicator(
            animating: true,
          ),
        );
        break;
      case ViewModelTyple.success:
        child = buildCallback(context);
        break;
      default:
        child = _errWidget(typle);
        break;
    }
    return Container(
      child: child,
    );
  }
}
