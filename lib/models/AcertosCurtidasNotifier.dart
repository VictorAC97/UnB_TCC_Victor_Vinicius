import 'package:flutter/material.dart';

class AcertosCurtidasNotifier extends ChangeNotifier {
  List<String> _lista = [];
  get lista => _lista;

  addAcerto(String emojiCorreto) {
    if (!_lista.contains(emojiCorreto)) {
      _lista.add(emojiCorreto);
      notifyListeners();
    }
  }

  limparAcertos() {
    _lista = [];
    notifyListeners();
  }
}
