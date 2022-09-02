import 'package:flutter/material.dart';
import 'package:projeto_final_unb/utilities/dashedLinePainter.dart';

class TelaInstrucoesModulo2 extends StatelessWidget {
  const TelaInstrucoesModulo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 36.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: CustomPaint(
                    size: const Size(1, double.infinity),
                    painter: DashedLineVerticalPainter(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  title: Text(
                    "Bem vindo ao Módulo 2!".toUpperCase(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  title: Text(
                    "Aqui aprenderemos sobre emojis, comentários, compartilhamentos."
                        .toUpperCase(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 360.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  title: Text(
                    "Contamos com lições para cada tópico.".toUpperCase(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 540.0),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Text(
                      "4",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  title: Text(
                    "Para navegar entre paginas, arraste para esquerda ou direita."
                        .toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
