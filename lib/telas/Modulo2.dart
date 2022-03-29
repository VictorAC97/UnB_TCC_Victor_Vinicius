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
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("MÓDULO 2 - Significado dos Emojis"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}