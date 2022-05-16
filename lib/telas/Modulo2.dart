import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/TelaConfiguracoes.dart';
import 'package:projeto_final_unb/telas/TelaConfiguracoesModulo2.dart';
import 'package:projeto_final_unb/telas/TelaInstrucoesModulo2.dart';
import 'package:projeto_final_unb/telas/TelaTarefaComentar.dart';
import 'package:projeto_final_unb/telas/TelaTarefaCompartilhar.dart';
import 'package:projeto_final_unb/telas/TelaTarefaCurtir.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';

class Modulo2 extends StatefulWidget {
  Usuario? user;
  AppSettings? appSettings;
  Modulo2({Key? key, required this.user, required this.appSettings})
      : super(key: key);

  @override
  State<Modulo2> createState() => _Modulo2State();
}

class _Modulo2State extends State<Modulo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("MÓDULO 2 - Significado dos Emojis"),
      ),
      body: Center(
        child: PageView(
          children: [
            TelaInstrucoesModulo2(),
            TelaConfiguracoesModulo2(appSettings: widget.appSettings!),
            TelaTarefaCurtir(),
            TelaTarefaComentar(),
            TelaTarefaCompartilhar(),
          ],
        ),
      ),
    );
  }
}
