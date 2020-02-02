import 'package:carros/Entity/Carro.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
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
    String _localText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ut neque pharetra nibh consequat ornare. Duis molestie, est id sodales molestie, odio massa posuere ante, eget consequat nulla leo eu mi. Ut aliquet, velit vel mollis euismod, orci ligula euismod tortor, sed fringilla tortor nunc et mauris. Ut sem arcu, elementum et hendrerit vitae, laoreet a leo. Proin porta semper justo, id finibus elit convallis ut. Maecenas lobortis venenatis ligula vel aliquam. Donec volutpat, arcu fermentum molestie laoreet, enim velit vestibulum sem, et vehicula magna leo eu sem. Nam posuere ut purus ut pharetra. Praesent eget est vitae erat scelerisque posuere. Fusce a nunc nibh.\n\nMorbi blandit ex non purus sagittis, at fringilla neque rhoncus. Curabitur ut ultrices magna, nec placerat libero. Vestibulum non nibh id nunc lacinia rhoncus sed vel quam. In ornare placerat ipsum sed sagittis. Etiam pharetra ante non diam dignissim pharetra. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur ullamcorper, velit nec convallis commodo, diam ipsum mollis nisi, eget consequat enim justo et dui. Sed scelerisque lectus mi, vel vulputate eros blandit a. Proin feugiat risus augue, ut sollicitudin tortor fringilla sit amet. Aenean commodo urna enim, in lobortis eros tincidunt tristique. Vestibulum gravida laoreet massa, quis cursus nunc convallis at.\n\nSuspendisse potenti. Nullam id lorem aliquam odio semper gravida vel quis mauris. Nam posuere ligula consectetur vulputate lacinia. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent scelerisque nibh vel lacus viverra, in dictum purus euismod. Phasellus sodales, neque eget tempus tempor, augue sapien lobortis tellus, sed porta libero ipsum ac lacus. Quisque ex ante, vulputate et blandit quis, tempus ut ipsum. Ut sit amet orci nunc. Sed ultrices turpis nec ligula laoreet porta quis eget dui.";
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Center(
              child: Text(
            carro.nome,
            style: TextStyle(fontSize: 22),
          )),
          SizedBox(
            height: 20,
          ),
          Image.network(carro.urlFoto),
          SizedBox(
            height: 20,
          ),
          _optionRow(),
          SizedBox(
            height: 20,
          ),
          SelectableText(_localText),
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
              carro.nome,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(carro.tipo, style: TextStyle(fontSize: 16))
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
}
