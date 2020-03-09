import 'dart:async';

import 'package:carros/DataBase/base-dao.dart';
import 'package:carros/Entity/Carro.dart';

// Data Access Object
class CarroDAO extends BaseDao<Carro>{
  @override
  String get tableName => "carro";

  @override
  Carro fromMap(Map<String, dynamic> map) {
    return Carro.fromMap(map);
  }


  Future<List<Carro>> findAllByTipo(String tipo) async {
    List<Carro> carros = await query('select * from carro where tipo =? ',[tipo]);
    return carros;
  }


}
