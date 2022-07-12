import 'package:flutter/cupertino.dart';
import 'package:projeto_final_unb/models/Comentario.dart';
import 'package:projeto_final_unb/models/Post.dart';

class CompartilhamentosNotifier extends ChangeNotifier {
  List<Post> _lista = [];

  List<Post> get lista => _lista;

  compartilhar(Post newPost) {
    _lista.add(newPost);
    notifyListeners();
  }

  comentarNoPost(Comentario comentario, Post post) {
    if (_lista.contains(post)) {
      post.comentarios.add(comentario);
    }
    notifyListeners();
  }

  curtirPost(Post post) {
    post.curtidas++;
    notifyListeners();
  }

  descurtirPost(Post post) {
    post.curtidas > 0 ? post.curtidas-- : null;
    notifyListeners();
  }

  removerComentarioNoPost(Post post, Comentario comentario) {
    if (_lista.contains(post)) {
      post.comentarios.remove(comentario);
    }
    notifyListeners();
  }

  limparFeed() {
    _lista = [];
    notifyListeners();
  }
}
