import 'package:carros/Utils/Navegation.dart';
import 'package:carros/widgets/Blue_button.dart';
import 'package:flutter/material.dart';

showAlert(BuildContext context, String titulo, String message) {
	showDialog(
		barrierDismissible: false,
		context: context,
		builder: (context) {
			//WillPopScop é para o android nao cancelar o Dialog quando clicar no botao voltar
			return WillPopScope(
				//Async function cancela o POP do botao voltar
				onWillPop: () async => false,
				child: AlertDialog(
					title: Text(titulo),
					content: Text(message),
					actions: <Widget>[
						BlueButton("OK", () {
							pop(context);
						}),
					],
				),
			);
		});
}