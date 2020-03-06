import 'dart:async';

import 'package:carros/Blocs/simple_bloc.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Services/favorito_service.dart';

class FavoritosBloc extends SimpleBloc<List<Carro>>{

	Future<List<Carro>>fetch() async{
		try{
			List<Carro> carros = await FavoritoService.getCarros();
			add(carros);
			return carros;
		}catch(error){
			addError(error);
		}
	}


}