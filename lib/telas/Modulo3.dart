import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';

class Modulo3 extends StatefulWidget {
  Usuario? user;
  Modulo3({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo3> createState() => _Modulo3State();
}

class _Modulo3State extends State<Modulo3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("MÓDULO 3 - "),
        centerTitle: true,
      ),
      body: const Center(),
    );
  }
}
