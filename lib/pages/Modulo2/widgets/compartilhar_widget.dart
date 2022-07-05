import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:provider/provider.dart';

class CompartilharWidget extends StatefulWidget {
  final String pictureName;
  const CompartilharWidget({Key? key, required this.pictureName})
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
    Map<String, String> newPost = {
      'comentario': '',
      'foto': widget.pictureName,
      'data': '',
    };
    String mensagem = '';

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
            newPost['comentario'] = mensagem;
            newPost['foto'] = widget.pictureName;
            newPost['data'] = DateTime.now().toString();
            feed.compartilhar(newPost);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
