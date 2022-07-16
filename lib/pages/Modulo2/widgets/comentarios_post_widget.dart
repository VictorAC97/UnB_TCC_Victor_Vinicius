import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:projeto_final_unb/models/Post.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/comentario_post_card_widget.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/novo_comentario_post_dialog.dart';
import 'package:provider/provider.dart';

class ComentariosPostWidget extends StatefulWidget {
  final Usuario user;
  final Post post;
  const ComentariosPostWidget(
      {Key? key, required this.post, required this.user})
      : super(key: key);

  @override
  State<ComentariosPostWidget> createState() => _ComentariosPostWidgetState();
}

late TextEditingController _controller;
late ScrollController _scrollController;

class _ComentariosPostWidgetState extends State<ComentariosPostWidget> {
  @override
  void initState() {
    _scrollController = ScrollController();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('COMENTÁRIOS'),
      content: Consumer<CompartilhamentosNotifier>(
        builder: (context, value, child) {
          return SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: widget.post.comentarios.isEmpty
                ? const Text('Ainda não há nenhum comentário.')
                : Scrollbar(
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: widget.post.comentarios.length,
                      itemBuilder: ((context, index) {
                        int reverseIndex =
                            widget.post.comentarios.length - 1 - index;
                        return ComentarioPostCardWidget(
                            comentario: widget.post.comentarios[reverseIndex]);
                      }),
                    ),
                  ),
          );
        },
      ),
      actions: [
        OutlinedButton(
          child: const Text('Voltar'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: () {
            _controller.clear();
            Navigator.pop(context);
          },
        ),
        ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          icon: const Icon(Icons.comment),
          label: const Text('Comentar'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => NovoComentarioPostDialog(
                user: widget.user,
                post: widget.post,
              ),
            );
          },
        ),
      ],
    );
  }
}
