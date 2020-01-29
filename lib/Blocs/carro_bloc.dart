import 'package:carros/Apis/carros_api.dart';
import 'package:carros/Blocs/simple_bloc.dart';
import 'package:carros/Entity/Carro.dart';

class CarroBloc extends SimpleBloc<List<Carro>>{

	fetch(String tipo) async{
		try{
			List<Carro> carros = await CarrosApi.getCarros(tipo);
			add(carros);
		}catch(error){
			addError(error);
		}
	}
}