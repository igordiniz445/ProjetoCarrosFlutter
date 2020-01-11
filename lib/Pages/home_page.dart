import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: _body(),
    );
  }

  _body() {
    return Center(
      child: Container(
        child: Text("Igor"),
      ),
    );
  }
}
