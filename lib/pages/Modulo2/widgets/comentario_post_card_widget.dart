import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Comentario.dart';

class ComentarioPostCardWidget extends StatefulWidget {
  final Comentario comentario;
  const ComentarioPostCardWidget({Key? key, required this.comentario})
      : super(key: key);

  @override
  State<ComentarioPostCardWidget> createState() =>
      _ComentarioPostCardWidgetState();
}

late Timer timer;

class _ComentarioPostCardWidgetState extends State<ComentarioPostCardWidget> {
  @override
  void initState() {
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: widget.comentario.autor.fotoPerfil == null
            ? const Icon(Icons.person)
            : SizedBox(
                width: 50,
                height: 50,
                child: ClipOval(
                  child: Image.file(
                    widget.comentario.autor.fotoPerfil!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
      title: Text(widget.comentario.autor.nome!),
      subtitle: Text(widget.comentario.mensagem),
      trailing: horarioDecorrido(widget.comentario.data),
    );
  }

  horarioDecorrido(DateTime date) {
    String tempo = DateTime.now().difference(date).inMinutes < 60
        ? '${DateTime.now().difference(date).inMinutes} min atrás'
        : '${DateTime.now().difference(date).inHours} h atrás';

    return Text(tempo);
  }
}
