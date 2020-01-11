import 'package:carros/Apis/login_api.dart';
import 'package:carros/Entity/Usuario.dart';
import 'package:carros/Pages/home_page.dart';
import 'package:carros/Utils/Navegation.dart';
import 'package:carros/widgets/Blue_button.dart';
import 'package:carros/widgets/Flat_button.dart';
import 'package:carros/widgets/Text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  BuildContext _context;
  final _userText = TextEditingController();
  final _passwordText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _body(),
    );
  }

  _body() {
    return Builder(builder: (context) {
      this._context = context;
      return Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _header(),
                  _loginForm(),
                  _passwordForm(),
                  _loginButton(),
                  _signUpButton(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _logUser() async {
    _userText.text = "user";
    _passwordText.text = "123";
    //if(_formKey.currentState.validate()){}
    Usuario user = await LoginApi.logar(_userText.text, _passwordText.text);
    if (user != null) {
      print(user);
      push(_context, HomePage());
    }else{

    }
  }

  _header() {
    return Column(
      children: <Widget>[
        FlutterLogo(
          size: 100,
        ),
        Text(
          "Flutter App",
          style: TextStyle(fontSize: 34, color: Colors.blueAccent),
        ),
      ],
    );
  }

  _loginForm() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Text_fieldUser("Usuário", "Digite seu login", _userText),
    );
  }

  _passwordForm() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Text_fieldPass("Senha", "Digite sua senha", _passwordText),
    );
  }

  _loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: BlueButton("Login", () => _logUser()),
    );
  }

  _signUpButton() {
    return Container(
      //margin: EdgeInsets.only(top: 5),
      child: FlatSimpleButton("Create account", () => _signUp()),
    );
  }

  _signUp() async {}
}
