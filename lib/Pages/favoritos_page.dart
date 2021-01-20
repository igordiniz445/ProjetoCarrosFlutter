import 'package:carros/Apis/carros_api.dart';
import 'package:carros/Blocs/carro_bloc.dart';
import 'package:carros/Blocs/favoritos_block.dart';
import 'package:carros/Blocs/simple_bloc.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:carros/Pages/carros_page.dart';
import 'package:carros/Utils/Navegation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../Blocs/favoritos_block.dart';
import '../Blocs/favoritos_block.dart';
import '../Blocs/favoritos_block.dart';
import '../main.dart';

class FavoritosPage extends StatefulWidget {
  @override
  _FavoritosPageState createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage>
    with AutomaticKeepAliveClientMixin {
  List<Carro> carros;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<FavoritosBloc>(context, listen: false).fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: Provider.of<FavoritosBloc>(context).stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: Text("Não foi possível recuperar lista de carros"),
          );
        }
        if (!snapshot.hasData) {
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
                      child: CachedNetworkImage(
                        imageUrl: carro.urlFoto,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
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
    return Provider.of<FavoritosBloc>(context, listen: false).fetch();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
