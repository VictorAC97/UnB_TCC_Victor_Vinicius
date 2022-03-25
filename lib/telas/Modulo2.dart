import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import '../widgets/Anexo.dart';

class Modulo2 extends StatefulWidget {
  Usuario? user;
  Modulo2({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo2> createState() => _Modulo2State();
}

class _Modulo2State extends State<Modulo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Módulo 2 - "),
      ),
      body: Column(
        children: [
          Anexo(largura: 200, altura: 200, picture: widget.user!.fotoPerfil),
          Padding(padding: EdgeInsets.all(16)),
          Text("Nome: ${widget.user!.nome}"),
        ],
      ),
    );
  }
}
