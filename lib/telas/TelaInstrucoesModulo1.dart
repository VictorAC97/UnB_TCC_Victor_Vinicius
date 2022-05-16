import 'package:flutter/material.dart';

class TelaInstrucoesModulo1 extends StatelessWidget {
  const TelaInstrucoesModulo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text("AQUI VIRÃO AS INSTRUÇÕES PARA O MODULO 1."),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                  "Para navegar entre paginas, arraste o dedo para esquerda ou direita."
                      .toUpperCase()),
            ],
          ),
        ),
      )),
    );
  }
}
