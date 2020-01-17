import 'package:flutter/material.dart';

Future push(BuildContext context, Widget widget, {bool replace = false}) async {
  if (replace) {
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));
  }
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return widget;
  }));
}

Future pop(context, {var extras}) {
  Navigator.pop(context, extras);
}
