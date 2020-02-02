import 'package:carros/Apis/carros_api.dart';
import 'package:carros/Blocs/carro_bloc.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Pages/carros_page.dart';
import 'package:carros/Utils/Navegation.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatefulWidget {
  String tipoCarro;
  CarrosListView(this.tipoCarro);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin {

  List<Carro> carros;
  CarroBloc _bloc = CarroBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.fetch(this.widget.tipoCarro);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text("Não foi possível recuperar lista de carros");
        }if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;
        return RefreshIndicator(
          onRefresh: _refresh,
          child: _listView(carros),
        );
      },
    );


    }

  _listView(carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro carro = carros[index];
            return Card(
              color: Colors.white10,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Hero(
                        tag: carro.nome,
                        child: Image.network(
                          carro.urlFoto,
                          width: 250,
                        ),
                      ),
                    ),
                    Text(
                      carro.nome,
                      style: TextStyle(fontSize: 22),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () {
                              push(context, CarroPage(carro));
                            },
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
  Future<void> _refresh() {
    return _bloc.fetch(this.widget.tipoCarro);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


}
