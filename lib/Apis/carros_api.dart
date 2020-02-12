import 'dart:convert';

import 'package:carros/DataBase/carro-dao.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Entity/Usuario.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classico = "classicos";
  static final String esportivo = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipoCarro) async {
    Usuario user = await Usuario.get();
    Map<String, String> header = {
      "Content-type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    String url =
        "https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipoCarro";

    var response = await http.get(url, headers: header);

    List mapResponse = jsonDecode(response.body);
    List<Carro> carros = List<Carro>();

    carros = mapResponse.map((map) => Carro.fromJson(map)).toList();

    var dao = CarroDAO();
    for (Carro carro in carros) {
      dao.save(carro);
    }
    return carros;
  }
}
