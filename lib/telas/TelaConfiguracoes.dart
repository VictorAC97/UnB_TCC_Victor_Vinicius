import 'package:flutter/material.dart';

class TelaConfiguracoes extends StatefulWidget {
  TelaConfiguracoes({Key? key}) : super(key: key);

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("CONFIGURAÇÕES"),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
