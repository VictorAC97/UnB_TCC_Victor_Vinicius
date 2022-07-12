import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:projeto_final_unb/models/Post.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:provider/provider.dart';

class CompartilharWidget extends StatefulWidget {
  final Usuario? user;
  final String pictureName;
  const CompartilharWidget({Key? key, required this.pictureName, this.user})
      : super(key: key);

  @override
  State<CompartilharWidget> createState() => _CompartilharWidgetState();
}

late TextEditingController _controller;

class _CompartilharWidgetState extends State<CompartilharWidget> {
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
    var feed = context.watch<CompartilhamentosNotifier>();
    String mensagem = '';
    late Usuario _user;
    late Post _post;

    if (widget.user!.nome == '') {
      _user = Usuario(
        nome: 'Anônimo',
      );
    } else {
      _user = widget.user!;
    }

    return AlertDialog(
      title: Column(
        children: const [
          Text('Compartilhar Foto'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              maxLength: 200,
              decoration: const InputDecoration(
                label: Text('No que você esta pensando?'),
              ),
              onChanged: (value) {
                mensagem = value;
              },
            ),
            Image.asset(
              "assets/images/imagensCurtir/${widget.pictureName}",
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Voltar'),
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.share),
          label: const Text('Compartilhar'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: () {
            _post = Post(
              foto: widget.pictureName,
              data: DateTime.now(),
              mensagem: mensagem,
              autor: _user,
              comentarios: [],
            );
            feed.compartilhar(_post);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('FOTO COMPARTILHADA!')));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
