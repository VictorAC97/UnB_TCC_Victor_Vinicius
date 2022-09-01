import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarPalavraFrase.dart';

class TelaTarefaPodeEscrever extends StatefulWidget {
  List<Map<String, dynamic>> listaFrasesPalavras;
  List<Map<String, dynamic>> acertos;

  TelaTarefaPodeEscrever({
    Key? key,
    required this.listaFrasesPalavras,
    required this.acertos,
  }) : super(key: key);

  @override
  State<TelaTarefaPodeEscrever> createState() => _TelaTarefaPodeEscreverState();
}

class _TelaTarefaPodeEscreverState extends State<TelaTarefaPodeEscrever> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Text(
                "O QUE POSSO ESCREVER NAS REDES SOCIAIS ?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 1.0),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: widget.listaFrasesPalavras
                        .map(
                          (e) => Draggable<Map<String, dynamic>>(
                            feedback: Container(
                              child: Center(
                                child: Text(
                                  '${e["frase-palavra"]}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 3),
                                color: const Color.fromARGB(255, 221, 221, 221),
                              ),
                            ),
                            child: widget.acertos.contains(e)
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 50,
                                  )
                                : Container(
                                    child: Center(
                                        child: Text(
                                      '${e["frase-palavra"]}',
                                      textAlign: TextAlign.center,
                                    )),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 3),
                                      color: const Color.fromARGB(
                                          255, 221, 221, 221),
                                    ),
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
                    child: Center(
                        child: Text(
                      "Arraste a resposta até aqui.".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3),
                      color: const Color.fromARGB(255, 165, 165, 165),
                    ),
                  );
                }),
                onWillAccept: (data) => data!.containsValue(true),
                onAccept: (data) {
                  setState(() {
                    widget.acertos.add(data);
                  });
                },
                onLeave: (data) {
                  if (data!.containsValue(false)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('NÃO ESCREVA ISSO NAS REDES SOCIAIS!')));
                  }
                },
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.shuffle, size: 40),
          onPressed: () {
            setState(() {
              widget.acertos = [];
              widget.listaFrasesPalavras = gerarPalavrasFrases();
            });
          }),
    );
  }
}
