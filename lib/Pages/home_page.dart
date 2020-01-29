import 'package:carros/Apis/carros_api.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Pages/carros_listview.dart';
import 'package:carros/Preferences/prefs.dart';
import 'package:carros/Utils/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener((){
      Prefs.setInt("tabIndex", _tabController.index);
    });
    _getLastTab();
  }
  void _getLastTab()async {
    _tabController.index = await Prefs.getInt("tabIndex");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: "Clássicos"),
            Tab(text: "Esportivos",),
            Tab(text: "Luxo",),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CarrosListView(TipoCarro.classico),
          CarrosListView(TipoCarro.esportivo),
          CarrosListView(TipoCarro.luxo),

        ],
      ),
      drawer: Drawer_list(),
    );
  }


}
