import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/ListaPodePostar.dart';

class TelaTarefaPodePostarFoto extends StatefulWidget {
  const TelaTarefaPodePostarFoto({Key? key}) : super(key: key);

  @override
  State<TelaTarefaPodePostarFoto> createState() =>
      _TelaTarefaPodePostarFotoState();
}

List<Map<String, dynamic>> acertos = [];
List<Map<String, dynamic>> nomesFotos = [];

List<Map<String, dynamic>> gerarNomesFotos() {
  var randomNum = Random();
  int i = 0;
  //acertos
  while (i < 3) {
    int num = randomNum.nextInt(listaPodePostar.length);
    if (!nomesFotos.contains(listaPodePostar[num])) {
      nomesFotos.add(listaPodePostar[num]);
      i++;
    }
  }
  //erros
  //for (int i = 0; i < 3; i++) {
  //int num = randomNum.nextInt(listaNaoPodePostar.length);
  //nomesFotos.add(listaNaoPodePostar[num]);
  //}
  print("${nomesFotos.length}: $nomesFotos");
  return nomesFotos;
}

class _TelaTarefaPodePostarFotoState extends State<TelaTarefaPodePostarFoto> {
  @override
  Widget build(BuildContext context) {
    nomesFotos = [];
    gerarNomesFotos();
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text(
              "O QUE POSSO POSTAR NAS REDES SOCIAIS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 1.0),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  children: nomesFotos
                      .map(
                        (e) => Draggable<Map<String, dynamic>>(
                          feedback: SizedBox(
                            height: 100,
                            child: Image.asset(
                                'assets/images/imagensPostar/${e["nome_foto"]}'),
                          ),
                          child: acertos.contains(e)
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 50,
                                )
                              : SizedBox(
                                  height: 150,
                                  child: Image.asset(
                                      'assets/images/imagensPostar/${e["nome_foto"]}'),
                                ),
                          childWhenDragging: Container(),
                          data: e,
                        ),
                      )
                      .toList()),
            ),
            DragTarget<Map<String, dynamic>>(
              builder: ((context, candidateData, rejectedData) {
                return Container(
                  height: 90,
                  width: 150,
                  color: Colors.blue,
                );
              }),
              onWillAccept: (data) => data!.containsValue(true),
              onAccept: (data) {
                setState(() {
                  acertos.add(data);
                });
              },
            ),
          ]),
        ),
      ),
    );
  }
}
