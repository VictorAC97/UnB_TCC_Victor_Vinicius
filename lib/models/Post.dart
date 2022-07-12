import 'package:projeto_final_unb/models/Comentario.dart';
import 'package:projeto_final_unb/models/Usuario.dart';

class Post {
  Usuario autor;
  String foto;
  String mensagem;
  DateTime data;
  int curtidas = 0;
  List<Comentario> comentarios = [];

  Post({
    required this.autor,
    required this.foto,
    required this.data,
    required this.mensagem,
    required this.comentarios,
  });
}
