import 'package:flutter/material.dart';

class Modulo3 extends StatefulWidget {
  const Modulo3({Key? key}) : super(key: key);

  @override
  State<Modulo3> createState() => _Modulo3State();
}

class _Modulo3State extends State<Modulo3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("MÓDULO 3 - "),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
