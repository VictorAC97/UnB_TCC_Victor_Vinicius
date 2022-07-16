import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Comentario.dart';

class ComentariosNotifier extends ChangeNotifier {
  List<Comentario> _comentarios = [];
  bool animationContainerVisible = false;

  List<Comentario> get comentarios => _comentarios;

  abrirContainer() {
    animationContainerVisible = true;
    notifyListeners();
  }

  fecharContainer() {
    animationContainerVisible = false;
    notifyListeners();
  }

  addComentario(Comentario newComentario) {
    _comentarios.add(newComentario);
    notifyListeners();
    fecharContainer();
  }

  removerComentario(Comentario comentario) {
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
