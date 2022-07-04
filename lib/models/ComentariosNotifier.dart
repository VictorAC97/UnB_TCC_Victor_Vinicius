import 'package:flutter/material.dart';

class ComentariosNotifier extends ChangeNotifier {
  List<String> _comentarios = [];

  List<String> get comentarios => _comentarios;

  addComentario(String newComentario) {
    _comentarios.add(newComentario);
    notifyListeners();
  }

  removerComentario(String comentario) {
    if (_comentarios.contains(comentario)) {
      _comentarios.remove(comentario);
    }
    notifyListeners();
  }

  limparComentarios() {
    _comentarios = [];
    notifyListeners();
  }
}
