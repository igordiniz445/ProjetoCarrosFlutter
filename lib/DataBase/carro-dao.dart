import 'dart:async';

import 'package:carros/DataBase/base-dao.dart';
import 'package:carros/Entity/Carro.dart';

// Data Access Object
class CarroDAO extends BaseDao<Carro>{
  @override
  // TODO: implement tableName
  String get tableName => "carro";

  @override
  Carro fromJson(Map<String, dynamic> map) {
    // TODO: implement fromJson
    return Carro.fromJson(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery('select * from $tableName where tipo =? ',[tipo]);

    final carros = list.map<Carro>((json) => fromJson(json)).toList();

    return carros;
  }

}
