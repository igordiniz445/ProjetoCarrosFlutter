import 'package:carros/DataBase/carro-dao.dart';
import 'package:carros/DataBase/favorito_dao.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Entity/Favorito.dart';

class FavoritoService{
	static Future<bool>favoritar(Carro c) async {
		Favorito f = Favorito.fromCarro(c);
		FavoritoDao dao = new FavoritoDao();
		final exists = await dao.exists(c.id);
		print(c.id);
		print(exists);
		if(exists){
			dao.delete(c.id);
			return false;
		}else{
			dao.save(f);
			return true;
		}
	}

	static Future<List<Carro>> getCarros() async {
		List<Carro> carros = await CarroDAO().query("select * from carro c,favoritos f where c.id = f.id;");
		return carros;
	}

	static Future<bool> isFavorito(Carro c) async {
		final dao = FavoritoDao();

		bool exists = await dao.exists(c.id);

		return exists;
	}
}