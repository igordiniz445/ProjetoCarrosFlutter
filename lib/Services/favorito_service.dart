import 'package:carros/DataBase/favorito_dao.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Entity/Favorito.dart';

class FavoritoService{
	static favoritar(Carro c) async {
		Favorito f = Favorito.fromCarro(c);
		FavoritoDao dao = new FavoritoDao();
		bool exists = await dao.exists(f.id);
		if(exists){
			dao.delete(f.id);
		}else{
			dao.save(f);
		}
		dao.save(f);
	}
}