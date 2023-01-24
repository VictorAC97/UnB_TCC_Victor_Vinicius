import 'package:flutter/material.dart';

class TelaCreditos extends StatefulWidget {
  const TelaCreditos({Key? key}) : super(key: key);

  @override
  State<TelaCreditos> createState() => _TelaCreditosState();
}

class _TelaCreditosState extends State<TelaCreditos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("SOBRE O APP"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'CRÉDITOS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Container(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "\tO aplicativo Projeto Participar - Redes Sociais é um aplicativo educacional para smartphones, gratuito, destinado a contribuir com o processo de aprendizagem de pessoas com deficiência intelectual em relação ao uso apropriado e seguro de redes sociais de internet. Este aplicativo será mais um produto do Projeto Participar (www.projetoparticipar.unb.br).",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '\tÉ um produto inédito no Brasil; visa apoiar um público muito vulnerável quando do uso de redes sociais. Os requisitos foram levantados junto a professores especialistas da área de educação especial, para que o aplicativo atendesse às necessidades e às particularidades do público alvo.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
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
