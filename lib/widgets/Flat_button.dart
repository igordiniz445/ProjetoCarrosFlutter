import 'package:flutter/material.dart';

class FlatSimpleButton extends StatelessWidget {
  String _buttonText;
  Function onPressed;
  Color color;

  FlatSimpleButton(this._buttonText, this.onPressed, {this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: GestureDetector(
        onTap: onPressed,
        child: Text(_buttonText,style: TextStyle(color: Colors.red, fontSize: 20, decoration: TextDecoration.underline),),
      ),
    );
  }
}
