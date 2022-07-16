import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Comentario.dart';
import 'package:projeto_final_unb/models/ComentariosNotifier.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:provider/provider.dart';

class ComentarioFieldWidget extends StatefulWidget {
  final Usuario user;
  const ComentarioFieldWidget({Key? key, required this.user}) : super(key: key);

  @override
  State<ComentarioFieldWidget> createState() => _ComentarioFieldWidgetState();
}

late TextEditingController _controller;

class _ComentarioFieldWidgetState extends State<ComentarioFieldWidget> {
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var comentarios = context.watch<ComentariosNotifier>();
    String textoComentario = '';
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          maxLength: 200,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text('Novo comentário'),
            icon: Icon(Icons.send_rounded),
          ),
          onChanged: (value) {
            textoComentario = value;
          },
        ),
        OutlinedButton.icon(
          onPressed: () {
            Comentario comentario = Comentario(
              mensagem: textoComentario,
              data: DateTime.now(),
              autor: widget.user,
            );
            comentarios.addComentario(comentario);
            _controller.clear();
          },
          label: const Text(
            'Enviar Comentário',
            style: TextStyle(color: Colors.black),
          ),
          icon: const Icon(
            Icons.send,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
