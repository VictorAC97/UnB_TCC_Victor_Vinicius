import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaConfiguracoesModulo2.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaInstrucoesModulo2.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaComentar.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaCompartilhar.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaCurtir.dart';
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
        title: const Text("MÓDULO 2"),
      ),
      body: Center(
        child: PageView(
          children: [
            const TelaInstrucoesModulo2(),
            TelaConfiguracoesModulo2(appSettings: widget.appSettings!),
            const TelaTarefaCurtir(),
            const TelaTarefaComentar(),
            const TelaTarefaCompartilhar(),
          ],
        ),
      ),
    );
  }
}
