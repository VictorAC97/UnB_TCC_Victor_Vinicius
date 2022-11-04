import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/app_settings.dart';

class TelaConfigurarDificuldades extends StatefulWidget {
  const TelaConfigurarDificuldades({Key? key}) : super(key: key);

  @override
  State<TelaConfigurarDificuldades> createState() =>
      _TelaConfigurarDificuldadesState();
}

class _TelaConfigurarDificuldadesState
    extends State<TelaConfigurarDificuldades> {
  @override
  Widget build(BuildContext context) {
    //var _infoDificuldade = context.watch<AppSettings>().infoDificuldade;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                "CONFIGURAÇÃO FORMA DE RESPONDER",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 1.0),
              Consumer<AppSettings>(
                builder: (context, appSettingsDificuldade, child) => Column(
                  children: [
                    RadioListTile<String>(
                      title: const Text("ARRASTAR E SOLTAR"),
                      activeColor: Colors.black,
                      groupValue:
                          appSettingsDificuldade.infoDificuldade['dificuldade'],
                      value: "arrastar",
                      onChanged: (value) {
                        setState(() {
                          appSettingsDificuldade.setInfoDificuldade(value!);
                          //valueDificuldade.changeDificuldade(value!);
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text("DUPLO TOQUE"),
                      activeColor: Colors.black,
                      groupValue:
                          appSettingsDificuldade.infoDificuldade['dificuldade'],
                      value: 'duplo-toque',
                      onChanged: (value) {
                        setState(() {
                          appSettingsDificuldade.setInfoDificuldade(value!);
                          //valueDificuldade.changeDificuldade(value!);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
