import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/CompartilhamentosNotifier.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/comentarios_post_widget.dart';
import 'package:provider/provider.dart';

class TelaFeedNoticias extends StatelessWidget {
  final Usuario user;
  const TelaFeedNoticias({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Feed de Noticias'),
      ),
      body: Consumer<CompartilhamentosNotifier>(
        builder: ((context, value, child) {
          return Scrollbar(
            thumbVisibility: true,
            controller: _scrollController,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: value.lista.length,
                itemBuilder: (context, index) {
                  int reverseIndex = value.lista.length - 1 - index;
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
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
                                  child: value.lista[reverseIndex].autor
                                              .fotoPerfil ==
                                          null
                                      ? const Icon(Icons.person)
                                      : SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: ClipOval(
                                            child: Image.file(
                                              value.lista[reverseIndex].autor
                                                  .fotoPerfil!,
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
                                      value.lista[reverseIndex].autor.nome!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          DateTime.now()
                                                      .difference(value
                                                          .lista[reverseIndex]
                                                          .data)
                                                      .inMinutes <
                                                  60
                                              ? '${DateTime.now().difference(value.lista[reverseIndex].data).inMinutes} min atrás'
                                              : '${DateTime.now().difference(value.lista[reverseIndex].data).inHours} h atrás',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(4)),
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
                                value.lista[reverseIndex].mensagem,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Image.asset(
                              "assets/images/imagensCurtir/${value.lista[reverseIndex].foto}"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '${value.lista[reverseIndex].comentarios.length} comentário(s)',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                                Text(
                                  '${value.lista[reverseIndex].curtidas} curtida(s)',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  value.curtirPost(value.lista[reverseIndex]);
                                },
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                icon: const Icon(Icons.thumb_up),
                                label: const Text('Curtir'),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          ComentariosPostWidget(
                                            post: value.lista[reverseIndex],
                                            user: user,
                                          ));
                                },
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                icon: const Icon(Icons.comment),
                                label: const Text('Comentar'),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                icon: const Icon(Icons.share),
                                label: const Text('Compartilhar'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
