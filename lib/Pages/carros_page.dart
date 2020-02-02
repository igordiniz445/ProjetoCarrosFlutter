import 'package:carros/Apis/loripsumApi.dart';
import 'package:carros/Entity/Carro.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatefulWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _loripsumBlock = LoripsunBlock();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loripsumBlock.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.place,
              color: Colors.white,
            ),
            onPressed: _onClickMapa(),
          ),
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Colors.white,
            ),
            onPressed: _onClickVideo(),
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == "x") {
                _editar();
              }
              if (value == "y") {
                _deletar();
              }
              if (value == "z") {
                _compartilhar();
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "x",
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  value: "y",
                  child: Text("Delete"),
                ),
                PopupMenuItem(
                  value: "z",
                  child: Text("Compartilhar"),
                ),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Center(
              child: Text(
            widget.carro.nome,
            style: TextStyle(fontSize: 22),
          )),
          SizedBox(height: 20),
          Hero(tag: widget.carro.nome,child: Image.network(widget.carro.urlFoto)),
          SizedBox(height: 20),
          _optionRow(),
          Divider(),
          //SelectableText(_localText),
          StreamBuilder<String>(
            stream: _loripsumBlock.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  width: 100,
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasError) {
                return Text("Houve um erro para receber a descrição");
              }
              return SelectableText(snapshot.data);
            },
          ),
        ],
      ),
    );
  }

  _onClickMapa() {}

  _onClickVideo() {}

  void _editar() {
    print("Vai editar");
  }

  void _deletar() {
    print("Vai deletar");
  }

  void _compartilhar() {
    print("Vai compartilhar");
  }

  _optionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.carro.nome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(widget.carro.tipo, style: TextStyle(fontSize: 16))
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 32,
              ),
              onPressed: _likeCar(),
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.blue,
                size: 32,
              ),
              onPressed: _shareCar(),
            ),
          ],
        ),
      ],
    );
  }

  _likeCar() {}

  _shareCar() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _loripsumBlock.dispose();
  }
}
