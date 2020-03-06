
import 'package:carros/DataBase/base-dao.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Entity/Favorito.dart';

class FavoritoDao extends BaseDao<Favorito>{

	@override
	String get tableName => "favoritos";

	@override
	Favorito fromJson(Map<String, dynamic> map) {
	// TODO: implement fromJson
	return null;
	}

	getFavoriteCar(){
		return query("Select * from carro as c, favoritos as f where c.id=f.id");
	}
}