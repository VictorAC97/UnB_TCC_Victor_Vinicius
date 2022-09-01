import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodeEscrever.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodePostarFoto.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarFotos.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarPalavraFrase.dart';

import 'pages/TelaInstrucoesModulo3.dart';

class Modulo3 extends StatefulWidget {
  Usuario? user;
  Modulo3({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo3> createState() => _Modulo3State();
}

class _Modulo3State extends State<Modulo3> {
  @override
  Widget build(BuildContext context) {
    var listaNomesFotos = gerarNomesFotos();
    var listaFrasesPalavras = gerarPalavrasFrases();
    List<Map<String, dynamic>> acertosFotos = [];
    List<Map<String, dynamic>> acertosFrasesPalavras = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("MÓDULO 3"),
        centerTitle: true,
      ),
      body: Center(
        child: PageView(
          children: [
            const TelaInstrucoesModulo3(),
            TelaTarefaPodePostarFoto(
              listaNomesFotos: listaNomesFotos,
              acertos: acertosFotos,
            ),
            TelaTarefaPodeEscrever(
              listaFrasesPalavras: listaFrasesPalavras,
              acertos: acertosFrasesPalavras,
            ),
          ],
        ),
      ),
    );
  }
}
