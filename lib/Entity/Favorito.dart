
import 'package:carros/Entity/Entity.dart';

import 'Carro.dart';

class Favorito extends Entity{
	int id;
	String nome;

	Favorito();

	Favorito.fromCarro(Carro c){
		id = c.id;
		nome = c.nome;
	}
	Favorito.fromMap(Map<String, dynamic> map) {
		id = map['id'];
		nome = map['nome'];
	}

	@override
	Map<String, dynamic> toMap() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nome'] = this.nome;
		return data;
	}
}