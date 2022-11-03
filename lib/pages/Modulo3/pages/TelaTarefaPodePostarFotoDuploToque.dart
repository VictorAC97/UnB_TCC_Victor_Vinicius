import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarFotos.dart';

class TelaTarefaPodePostarFotoDuploToque extends StatefulWidget {
  List<Map<String, dynamic>> listaNomesFotos;
  List<Map<String, dynamic>> acertos;
  TelaTarefaPodePostarFotoDuploToque(
      {Key? key, required this.listaNomesFotos, required this.acertos})
      : super(key: key);

  @override
  State<TelaTarefaPodePostarFotoDuploToque> createState() =>
      _TelaTarefaPodePostarFotoDuploToqueState();
}

class _TelaTarefaPodePostarFotoDuploToqueState
    extends State<TelaTarefaPodePostarFotoDuploToque> {
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
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: widget.listaNomesFotos
                        .map(
                          (e) => GestureDetector(
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
                            onDoubleTap: () {
                              if (e.containsValue(true)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Row(
                                    children: [
                                      const Text('PARABÉNS, VOCÊ É DEMAIS!   '),
                                      Image.asset(
                                        'assets/images/emojis/thumbUp.png',
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ));
                                setState(() {
                                  widget.acertos.add(e);
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Row(
                                    children: [
                                      const Text(
                                          'NÃO ESCREVA ISSO NAS REDES SOCIAIS!   '),
                                      Image.asset(
                                        'assets/images/emojis/thumbDown.png',
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                ));
                              }
                            },
                          ),
                        )
                        .toList()),
              ),
              const Padding(padding: EdgeInsets.all(32)),
            ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          icon: const Icon(Icons.restart_alt, size: 20),
          label: const Text("REINICIAR"),
          onPressed: () {
            setState(() {
              widget.acertos = [];
              widget.listaNomesFotos = gerarNomesFotos();
            });
          }),
    );
  }
}
