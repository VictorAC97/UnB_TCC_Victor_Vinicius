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
          children: [
            Column(
              children: [
                const Text(
                  "Idealização",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Profa. Maraisa Helena Borges Estevão Pereira",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text(
                        "Orientador",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Prof. Dr. Wilson Henrique Veneziano",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Desenvolvedores",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Victor Alves de Carvalho",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Marcus Vinícius Lopes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/credits/logoCic.png")),
            ),
          ],
        ),
      ),
    );
  }
}
