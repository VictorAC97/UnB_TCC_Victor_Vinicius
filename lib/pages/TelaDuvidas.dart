import 'package:flutter/material.dart';

class TelaDuvidas extends StatefulWidget {
  const TelaDuvidas({Key? key}) : super(key: key);

  @override
  State<TelaDuvidas> createState() => _TelaDuvidasState();
}

class _TelaDuvidasState extends State<TelaDuvidas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("SOBRE O APP"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Idealização - Profa. Maraisa Helena Borges Estevão Pereira",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Orientador - Prof. Dr. Wilson Henrique Veneziano",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Desenvolvedores - Victor Alves de Carvalho e Marcus Vinícius Lopes",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
