import 'package:carros/Apis/carros_api.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Pages/carros_listview.dart';
import 'package:carros/Preferences/prefs.dart';
import 'package:carros/Utils/drawer_list.dart';
import 'package:carros/widgets/AlertDialog.dart';
import 'package:flutter/material.dart';

import 'favoritos_page.dart';

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
    _tabController = TabController(length: 4, vsync: this);
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
            Tab(text: "Clássicos", icon: Icon(Icons.directions_car),),
            Tab(text: "Esportivos",icon: Icon(Icons.directions_car),),
            Tab(text: "Luxo",icon: Icon(Icons.directions_car),),
            Tab(text: "Favoritos",icon: Icon(Icons.favorite),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CarrosListView(TipoCarro.classico),
          CarrosListView(TipoCarro.esportivo),
          CarrosListView(TipoCarro.luxo),
          FavoritosPage(),
        ],
      ),
      drawer: Drawer_list(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCarro,
        child: Icon(Icons.add),
      ),
    );
  }



  void _addCarro() {
    showAlert(context, "Fuck The Sistem", "This is my rola branca");
  }
}
