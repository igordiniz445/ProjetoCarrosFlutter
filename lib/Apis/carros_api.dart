import 'dart:convert';

import 'package:carros/Entity/Carro.dart';
import 'package:http/http.dart' as http;
class TipoCarro{
	static final String classico = "classicos";
	static final String esportivo = "esportivos";
	static final String luxo = "luxo";
}
class CarrosApi{
	static Future<List<Carro>> getCarros(String tipoCarro) async{
		String url = "https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipoCarro";

		var response = await http.get(url);
		print("Response status code: ${response.statusCode}");

		List mapResponse = jsonDecode(response.body);
		List<Carro> carros = List<Carro>();



		carros = mapResponse.map((map)=>Carro.fromJson(map)).toList();

		return carros;
	}
}