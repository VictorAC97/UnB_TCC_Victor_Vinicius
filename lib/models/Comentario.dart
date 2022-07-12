import 'package:projeto_final_unb/models/Usuario.dart';

class Comentario {
  Usuario autor;
  String mensagem;
  DateTime data;

  Comentario({required this.autor, required this.mensagem, required this.data});
}
