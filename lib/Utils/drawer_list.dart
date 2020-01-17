
import 'package:carros/Pages/login_page.dart';
import 'package:carros/Utils/Navegation.dart';
import 'package:flutter/material.dart';

class Drawer_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Igor Otávio C. Diniz"),
              accountEmail: Text("igor.comp.ufla@outlook.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://scontent.fbhz2-1.fna.fbcdn.net/v/t1.0-1/p160x160/71303825_2759278970772974_5116893984844677120_n.jpg?_nc_cat=108&_nc_ohc=whsMIkVC2EcAQnB90M38EQJzWgRZ6phBQV6yHyVhzIJFe2FRx72DNjBxQ&_nc_ht=scontent.fbhz2-1.fna&oh=a03d902150d7e4e46bfc53c0e9808f42&oe=5EAF25CF"),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.photo,
                  color: Colors.green,
                ),
                title: Text("Pictures"),
                subtitle: Text("Cute dog picures"),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                ),
                onTap: () {
                  pop(context);
                  //push(context, HelloPage1());
                }),
            ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.green,
                ),
                title: Text("Logout"),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                ),
                onTap: () {
                  _onClickLogOut(context);
                }),
          ],
        ),
      ),
    );
  }

  void _onClickLogOut(BuildContext context) {
      pop(context);
      push(context, LoginPage(),replace: true);
  }
}
