import 'package:flutter/material.dart';

class TelaInstrucoesModulo3 extends StatelessWidget {
  const TelaInstrucoesModulo3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const Text(
                  "[a definir]\nAQUI VIRÃO AS INSTRUÇÕES PARA O MODULO 3."),
              const Padding(padding: EdgeInsets.all(8)),
              Text(
                  "Para navegar entre paginas, arraste para esquerda ou direita."
                      .toUpperCase()),
            ],
          ),
        ),
      )),
    );
  }
}
