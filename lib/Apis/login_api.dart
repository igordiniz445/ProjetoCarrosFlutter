import 'dart:convert';

import 'package:carros/Entity/Usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi{
	static Future<Usuario> logar(String login, String senha) async {

		Map<String, String> header = {"Content-type": "application/json"};

		Map parameters = {
			"username" : login,
			"password" : senha
		};

		String jParamentes = json.encode(parameters);

		var url = 'https://carros-springboot.herokuapp.com/api/v2/login';
		var response = await http.post(url, body: jParamentes, headers: header);
		print('Response status: ${response.statusCode}');
		//print('Response body: ${response.body}');

		Map mapResponse = json.decode(response.body);
		Usuario user = Usuario(mapResponse);

		return user;
	}
}