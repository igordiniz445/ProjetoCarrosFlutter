import 'dart:async';

import 'package:http/http.dart' as http;

class LoripsunBlock{
  final _streamController = StreamController<String>();
  Stream<String> get stream => _streamController.stream;

  fetch()async{
    String descicao = await Loripsum.getLoripsum();
    _streamController.add(descicao);
  }

  dispose(){
    _streamController.close();
  }

}

class Loripsum {
  static Future<String> getLoripsum() async{
    String url = 'https://loripsum.net/api';

    var response = await http.get(url);

    String textResponse = response.body;

    textResponse = textResponse.replaceAll("<p>", "");
    textResponse = textResponse.replaceAll("</p>", "\n");

    return textResponse;

  }
}
