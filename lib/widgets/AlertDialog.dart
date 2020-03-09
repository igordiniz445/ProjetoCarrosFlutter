import 'dart:io';

import 'package:carros/Utils/Navegation.dart';
import 'package:carros/widgets/Blue_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlert(BuildContext context, String titulo, String message) {
	android(){
		return AlertDialog(
			title: Text(titulo),
			content: Text(message),
			actions: <Widget>[
				BlueButton("OK", () {
					pop(context);
				}),
			],
		);
	}

	ios(){
		return CupertinoAlertDialog(
			title: Text(titulo),
			content: Text(message),
			actions: <Widget>[
				CupertinoButton(onPressed: (){pop(context);},child: Text("Cancelar"),),
			],
		);
	}

	showDialog(
		barrierDismissible: false,
		context: context,
		builder: (context) {
			//WillPopScop é para o android nao cancelar o Dialog quando clicar no botao voltar
			return WillPopScope(
				//Async function cancela o POP do botao voltar
				onWillPop: () async => false,
				child: Platform.isIOS ? ios() : android(),
			);
		});



}