import 'package:carros/Apis/login_api.dart';
import 'package:carros/Apis/login_response.dart';
import 'package:carros/Entity/Usuario.dart';
import 'package:carros/Pages/home_page.dart';
import 'package:carros/Utils/Navegation.dart';
import 'package:carros/widgets/AlertDialog.dart';
import 'package:carros/widgets/Blue_button.dart';
import 'package:carros/widgets/Flat_button.dart';
import 'package:carros/widgets/Text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext _context;

  final _userText = TextEditingController();

  final _passwordText = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _showProgress = false;

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
    _userText.text = "user";
    _passwordText.text = "123";
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
                  _showProgress ? _load() : _loginButton(),
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
    if (_formKey.currentState.validate()) {
      setState(() {
        _showProgress = true;
      });
      LoginResponse response =
          await LoginApi.logar(_userText.text, _passwordText.text);
      if (response.ok) {
        setState(() {
          _showProgress = false;
        });
        push(_context, HomePage(), replace: true);
      } else {
        setState(() {
          _showProgress = false;
        });
        showAlert(_context, "Erro ao efetuar login", response.message);
      }
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

  _load() {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 35),
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  _signUp() async {}
}
