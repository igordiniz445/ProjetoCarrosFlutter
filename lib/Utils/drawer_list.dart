import 'package:carros/Entity/Usuario.dart';
import 'package:carros/Pages/login_page.dart';
import 'package:carros/Utils/Navegation.dart';
import 'package:flutter/material.dart';

class Drawer_list extends StatelessWidget {
  Future<Usuario> future = Usuario.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario>(
              future: future,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.hasData){
                      Usuario user = snapshot.data;
                      return _header(user);
                  }
                  return _failedHeader();
              },
            ),
            ListTile(
                leading: Icon(
                  Icons.photo,
                  color: Colors.green,
                ),
                title: Text("Home"),
                subtitle: Text("Home Page dos carros"),
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
    push(context, LoginPage(), replace: true);
  }

  _header(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(user.urlFoto),
      ),
    );
  }

  _failedHeader(){
      return UserAccountsDrawerHeader(
          accountName: Text("Sem Nome"),
          accountEmail: Text("user@user.com"),
          currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://ipc.digital/wp-content/uploads/2016/07/icon-user-default.png"),
          ),
      );
  }
}
