import 'package:flutter/cupertino.dart';

class CompartilhamentosNotifier extends ChangeNotifier {
  List<Map<String, dynamic>> _lista = [];

  List<Map<String, dynamic>> get lista => _lista;

  compartilhar(Map<String, dynamic> newFoto) {
    _lista.add(newFoto);
    notifyListeners();
  }

  limparFeed() {
    _lista = [];
    notifyListeners();
  }
}
