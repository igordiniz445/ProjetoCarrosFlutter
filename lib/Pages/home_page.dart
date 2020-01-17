import 'package:carros/Apis/carros_api.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Pages/carros_listview.dart';
import 'package:carros/Utils/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Clássicos"),
              Tab(text: "Esportivos",),
              Tab(text: "Luxo",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CarrosListView(TipoCarro.classico),
            CarrosListView(TipoCarro.esportivo),
            CarrosListView(TipoCarro.luxo),

          ],
        ),
        drawer: Drawer_list(),
      ),
    );
  }
}
