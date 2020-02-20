import 'package:carros/DataBase/db-helper.dart';
import 'package:carros/Pages/login_page.dart';
import 'package:carros/Utils/Navegation.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future futureA = DatabaseHelper.getInstance().db;
    Future futureB = Future.delayed(Duration(seconds: 3));

    Future.wait([futureA, futureB]).then((value){
      push(context, LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
