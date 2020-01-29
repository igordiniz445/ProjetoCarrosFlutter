import 'dart:async';

class SimpleBloc<T>{
	final _builderController = StreamController<T>();
	Stream<T> get stream => this._builderController.stream;


	void add(T obj){
		_builderController.add(obj);
	}

	void addError(Object error){
		if(!_builderController.isClosed){
			_builderController.addError(error);
		}
	}

	void dispose(){
		_builderController.close();
	}
}