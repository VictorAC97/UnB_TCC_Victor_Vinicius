import 'package:flutter/cupertino.dart';

class CompartilhamentosNotifier extends ChangeNotifier {
  List<Map<String, String>> _lista = [];

  List<Map<String, String>> get lista => _lista;

  compartilhar(Map<String, String> newFoto) {
    _lista.add(newFoto);
    notifyListeners();
  }

  limparFeed() {
    _lista = [];
    notifyListeners();
  }
}
