import 'package:carros/Apis/carros_api.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatefulWidget {

  String tipoCarro;
  CarrosListView(this.tipoCarro);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  _body() {
    Future<List<Carro>> future = CarrosApi.getCarros(this.widget.tipoCarro);
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Não foi Possivel recuperar os carros"),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Carro> carros = snapshot.data;
          return _listView(carros);
        });
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
                      child: Image.network(
                        carro.urlFoto,
                        width: 250,
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
                              /* ... */
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
