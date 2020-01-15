import 'dart:convert';

import 'package:carros/Apis/login_response.dart';
import 'package:carros/Entity/Usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi{
	static Future<LoginResponse<Usuario>> logar(String login, String senha) async {
		try{
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
			if(response.statusCode == 200){
				Usuario user = Usuario(mapResponse);
				return LoginResponse.ok(user);
			}else{
				return LoginResponse.error(mapResponse["error"]);
			}

		}catch(excetion){
			return LoginResponse.error(excetion);
		}

	}
}