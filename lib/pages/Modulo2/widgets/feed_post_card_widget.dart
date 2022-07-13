import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:projeto_final_unb/models/Post.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/comentarios_post_widget.dart';
import 'package:provider/provider.dart';

class FeedPostCardWidget extends StatefulWidget {
  final Post post;
  final Usuario user;
  const FeedPostCardWidget({Key? key, required this.post, required this.user})
      : super(key: key);

  @override
  State<FeedPostCardWidget> createState() => _FeedPostCardWidgetState();
}

class _FeedPostCardWidgetState extends State<FeedPostCardWidget> {
  @override
  Widget build(BuildContext context) {
    var feedNotifier = context.watch<CompartilhamentosNotifier>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset.fromDirection(-10),
                  blurRadius: 3),
            ],
            color: const Color.fromARGB(255, 34, 34, 34),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    child: widget.post.autor.fotoPerfil == null
                        ? const Icon(Icons.person)
                        : SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipOval(
                              child: Image.file(
                                widget.post.autor.fotoPerfil!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.autor.nome!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        children: [
                          horarioDecorrido(widget.post.data),
                          const Padding(padding: EdgeInsets.all(4)),
                          const Icon(
                            Icons.public,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.post.mensagem,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Image.asset("assets/images/sugestoes/${widget.post.foto}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.post.curtidas} curtida(s)',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${widget.post.comentarios.length} comentário(s)',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Text(
                        '${widget.post.compartilhamentos} compartilhamento(s)',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {
                    feedNotifier.curtirPost(widget.post);
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('Curtir'),
                ),
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => ComentariosPostWidget(
                              post: widget.post,
                              user: widget.user,
                            ));
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  icon: const Icon(Icons.comment),
                  label: const Text('Comentar'),
                ),
                TextButton.icon(
                  onPressed: () {
                    feedNotifier.compartilharPost(widget.post);
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  icon: const Icon(Icons.share),
                  label: const Text('Compartilhar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  horarioDecorrido(DateTime date) {
    String tempo = DateTime.now().difference(date).inMinutes < 60
        ? '${DateTime.now().difference(date).inMinutes} min atrás'
        : '${DateTime.now().difference(date).inHours} h atrás';
    //usando o mounted para realizar setState apenas quando o widget estiver na arvore, pois se nao ele continua sendo atualizado fora da arvore e isso causa erro de memoria
    Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        setState(() {
          tempo;
        });
      }
    });

    return Text(
      tempo,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
