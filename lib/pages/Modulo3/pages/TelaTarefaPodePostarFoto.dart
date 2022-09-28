import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarFotos.dart';

class TelaTarefaPodePostarFoto extends StatefulWidget {
  List<Map<String, dynamic>> listaNomesFotos;
  List<Map<String, dynamic>> acertos;
  TelaTarefaPodePostarFoto(
      {Key? key, required this.listaNomesFotos, required this.acertos})
      : super(key: key);

  @override
  State<TelaTarefaPodePostarFoto> createState() =>
      _TelaTarefaPodePostarFotoState();
}

class _TelaTarefaPodePostarFotoState extends State<TelaTarefaPodePostarFoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Text(
                "O QUE POSSO POSTAR NAS REDES SOCIAIS ?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 1.0),
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: widget.listaNomesFotos
                        .map(
                          (e) => Draggable<Map<String, dynamic>>(
                            feedback: SizedBox(
                              height: 120,
                              child: Image.asset(
                                  'assets/images/imagensPostar/${e["nome_foto"]}'),
                            ),
                            child: widget.acertos.contains(e)
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
              const Padding(padding: EdgeInsets.all(5)),
              DragTarget<Map<String, dynamic>>(
                builder: ((context, candidateData, rejectedData) {
                  return Container(
                    child: Center(
                        child: Text(
                      "Toque na imagem correta e arraste até aqui."
                          .toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
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
                        content: Text('NÃO POSTE ISSO NAS REDES SOCIAIS!')));
                  }
                },
              ),
              const Padding(padding: EdgeInsets.all(32)),
            ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          icon: const Icon(Icons.shuffle, size: 40),
          label: const Text("REFAZER"),
          onPressed: () {
            setState(() {
              widget.acertos = [];
              widget.listaNomesFotos = gerarNomesFotos();
            });
          }),
    );
  }
}
