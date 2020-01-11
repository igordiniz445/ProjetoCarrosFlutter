import 'package:flutter/material.dart';

class Text_field extends StatelessWidget {
  String label;
  String validator;
  final controller;
  final hidetext;

  Text_field(
    this.label,
    this.validator,
    this.controller, {
    this.hidetext = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidetext,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
      ),
      cursorColor: Colors.white,
      controller: controller,
      validator: (_passwordText) {
        if (_passwordText.isEmpty) return validator;
        return null;
      },
    );
  }
}

class Text_fieldUser extends StatelessWidget {
  String label;
  String validator;
  final controller;
  final hidetext;

  Text_fieldUser(
    this.label,
    this.validator,
    this.controller, {
    this.hidetext = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidetext,
      decoration: InputDecoration(
        icon: Icon(
          Icons.person,
          color: Colors.blueAccent,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
      ),
      cursorColor: Colors.white,
      controller: controller,
      validator: (_passwordText) {
        if (_passwordText.isEmpty) return validator;
        return null;
      },
    );
  }
}

class Text_fieldPass extends StatelessWidget {
  String label;
  String validator;
  final controller;
  final hidetext;

  Text_fieldPass(
      this.label,
      this.validator,
      this.controller, {
        this.hidetext = false,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidetext,
      decoration: InputDecoration(
        icon: Icon(
          Icons.vpn_key,
          color: Colors.blueAccent,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
      ),
      cursorColor: Colors.white,
      controller: controller,
      validator: (_passwordText) {
        if (_passwordText.isEmpty) return validator;
        return null;
      },
    );
  }
}
