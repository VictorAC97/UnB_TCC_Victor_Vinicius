import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/ComentariosNotifier.dart';
import 'package:provider/provider.dart';

class ComentarioFieldWidget extends StatefulWidget {
  const ComentarioFieldWidget({Key? key}) : super(key: key);

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
    String newComentario = '';
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
            newComentario = value;
          },
        ),
        OutlinedButton.icon(
          onPressed: () {
            comentarios.addComentario(newComentario);
            _controller.clear();
          },
          label: const Text('Enviar Comentário'),
          icon: const Icon(Icons.send),
        )
      ],
    );
  }
}
