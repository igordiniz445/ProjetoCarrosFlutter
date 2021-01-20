import 'dart:async';

class Buss_evento {
  final _streamController = new StreamController<String>.broadcast();

  Stream<String> get stream => _streamController.stream;

  sendEvent(String event) {
    _streamController.add(event);
  }

  dispose() {
    _streamController.close();
  }
}
