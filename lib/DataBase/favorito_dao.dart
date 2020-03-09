import 'package:carros/DataBase/base-dao.dart';
import 'package:carros/Entity/Favorito.dart';

class FavoritoDao extends BaseDao<Favorito> {
  @override
  String get tableName => "favoritos";

  @override
  Favorito fromMap(Map<String, dynamic> map) {
    return Favorito.fromMap(map);
  }
}
