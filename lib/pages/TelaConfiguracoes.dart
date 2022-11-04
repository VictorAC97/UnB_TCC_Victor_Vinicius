import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaConfiguracoesModulo2.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';

class TelaConfiguracoes extends StatefulWidget {
  AppSettings appSettings;
  TelaConfiguracoes({
    Key? key,
    required this.appSettings,
  }) : super(key: key);

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    //var _infoVideo = widget.appSettings.infoVideo;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("CONFIGURAÇÕES"),
          centerTitle: true,
        ),
        body: TelaConfiguracoesModulo2(
          appSettings: widget.appSettings,
        ));
  }
}
