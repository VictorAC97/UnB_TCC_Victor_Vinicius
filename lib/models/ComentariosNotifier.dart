import 'package:flutter/material.dart';

class ComentariosNotifier extends ChangeNotifier {
  List<String> _comentarios = [];
  bool animationContainerVisible = false;

  List<String> get comentarios => _comentarios;

  abrirContainer() {
    animationContainerVisible = true;
    notifyListeners();
  }

  fecharContainer() {
    animationContainerVisible = false;
    notifyListeners();
  }

  addComentario(String newComentario) {
    _comentarios.add(newComentario);
    notifyListeners();
    fecharContainer();
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
