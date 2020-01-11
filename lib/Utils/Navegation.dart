import 'package:flutter/material.dart';

Future push(BuildContext context, Widget widget) async {
	return Navigator.push(context,
		MaterialPageRoute(builder: (BuildContext context) {
			return widget;
		}));
}
Future pop(context, {var extras}){
	Navigator.pop(context, extras);
}