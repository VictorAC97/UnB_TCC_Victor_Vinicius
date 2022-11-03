import 'package:flutter/cupertino.dart';

class DificuldadeNotifier extends ChangeNotifier {
  String _dificuldade = "arrastar";

  String get dificuldade => _dificuldade;

  changeDificuldade(String newDificuldade) {
    _dificuldade = newDificuldade;
    notifyListeners();
  }
}
