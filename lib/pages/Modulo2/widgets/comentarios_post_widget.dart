import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Comentario.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:projeto_final_unb/models/Post.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
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
    var post = context.watch<CompartilhamentosNotifier>();
    return AlertDialog(
      title: const Text('COMENTÁRIOS'),
      content: SizedBox(
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
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        child: widget.post.comentarios[reverseIndex].autor
                                    .fotoPerfil ==
                                null
                            ? const Icon(Icons.person)
                            : SizedBox(
                                width: 50,
                                height: 50,
                                child: ClipOval(
                                  child: Image.file(
                                    widget.post.comentarios[reverseIndex].autor
                                        .fotoPerfil!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      title: widget.user.nome != ''
                          ? Text(
                              widget.post.comentarios[reverseIndex].autor.nome!)
                          : const Text('ANÔNIMO'),
                      subtitle:
                          Text(widget.post.comentarios[reverseIndex].mensagem),
                      trailing: Text(
                        DateTime.now()
                                    .difference(widget
                                        .post.comentarios[reverseIndex].data)
                                    .inMinutes <
                                60
                            ? '${DateTime.now().difference(widget.post.comentarios[reverseIndex].data).inMinutes} min atrás'
                            : '${DateTime.now().difference(widget.post.comentarios[reverseIndex].data).inHours} h atrás',
                      ),
                    );
                  }),
                ),
              ),
      ),
      actions: [
        OutlinedButton(
            onPressed: () {
              _controller.clear();
              Navigator.pop(context);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: const Text('Voltar')),
        ElevatedButton.icon(
          onPressed: () {
            String comentario = '';
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
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
                      onPressed: () {
                        _controller.clear();
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      child: const Text('Voltar')),
                  ElevatedButton.icon(
                    onPressed: () {
                      var _comentario = Comentario(
                        autor: widget.user,
                        mensagem: comentario,
                        data: DateTime.now(),
                      );
                      if (comentario != '') {
                        post.comentarNoPost(_comentario, widget.post);
                      }
                      _controller.clear();
                      Navigator.pop(context);
                    },
                    label: const Text('Enviar'),
                    icon: const Icon(Icons.send),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                  )
                ],
              ),
            );
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          icon: const Icon(Icons.comment),
          label: const Text('Comentar'),
        ),
      ],
    );
  }
}
