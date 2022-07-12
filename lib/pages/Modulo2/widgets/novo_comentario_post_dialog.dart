import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Comentario.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:projeto_final_unb/models/Post.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:provider/provider.dart';

class NovoComentarioPostDialog extends StatefulWidget {
  final Usuario user;
  final Post post;
  const NovoComentarioPostDialog(
      {Key? key, required this.user, required this.post})
      : super(key: key);

  @override
  State<NovoComentarioPostDialog> createState() =>
      _NovoComentarioPostDialogState();
}

late TextEditingController _controller;

class _NovoComentarioPostDialogState extends State<NovoComentarioPostDialog> {
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
    String comentario = '';

    var post = context.watch<CompartilhamentosNotifier>();

    var _autor = widget.user.nome == '' && widget.user.fotoPerfil == null
        ? Usuario(nome: 'Anônimo')
        : widget.user;

    return AlertDialog(
      title: const Text('NOVO COMENTÁRIO'),
      content: SizedBox(
        width: 350,
        child: TextField(
          maxLines: 6,
          maxLength: 200,
          controller: _controller,
          onChanged: (value) {
            comentario = value;
          },
        ),
      ),
      actions: [
        OutlinedButton(
          child: const Text('Voltar'),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () {
            _controller.clear();
            Navigator.pop(context);
          },
        ),
        ElevatedButton.icon(
          label: const Text('Enviar'),
          icon: const Icon(Icons.send),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () {
            var _comentario = Comentario(
              autor: _autor,
              mensagem: comentario,
              data: DateTime.now(),
            );

            if (comentario != '') {
              post.comentarNoPost(_comentario, widget.post);
            }
            _controller.clear();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
