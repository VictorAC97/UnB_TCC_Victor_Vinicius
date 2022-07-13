import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Emprego.dart';
import 'package:projeto_final_unb/models/Endereco.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/Modulo1.dart';
import 'package:projeto_final_unb/pages/Modulo2/Modulo2.dart';
import 'package:projeto_final_unb/pages/Modulo3/Modulo3.dart';
import 'package:projeto_final_unb/pages/TelaConfiguracoes.dart';
import 'package:projeto_final_unb/pages/TelaDuvidas.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  late AppSettings appSettings;
  Usuario usuario = _novoUsuario();

  @override
  Widget build(BuildContext context) {
    appSettings = AppSettings();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 160, bottom: 128),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logos/logoRedesSociais2.png",
              width: 450,
            ),
            Container(
              padding: const EdgeInsets.only(top: 48, left: 72, right: 72),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "MÓDULO 1",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Modulo1(user: usuario)));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "MÓDULO 2",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Modulo2(
                                      user: usuario,
                                      appSettings: appSettings,
                                    )));
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "MÓDULO 3",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Modulo3(user: usuario)));
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  OutlinedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "CONFIGURAÇÕES",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TelaConfiguracoes(appSettings: appSettings),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TelaDuvidas()));
          },
          child: const Icon(Icons.help_outline, size: 40)),
    );
  }
}

_novoUsuario() {
  return Usuario(
    nome: "",
    dataNasc: DateTime.now(),
    idade: "",
    alturaMetro: "",
    alturaCentimetro: "",
    pesoQuilos: "",
    pesoGramas: "",
    relacionamento: "",
    isPublic: true,
    telefone: "",
    listaCorOlhos: List.empty(growable: true),
    listaEuSou: List.empty(growable: true),
    listaCorPreferida: List.empty(growable: true),
    listaMinhaCorPele: List.empty(growable: true),
    listaGostoDe: List.empty(growable: true),
    listaNaoGostoDe: List.empty(growable: true),
    listaSigno: List.empty(growable: true),
    listaEscolaridade: List.empty(growable: true),
    listaAtividades: List.empty(growable: true),
    listaMinhaComidaPreferida: List.empty(growable: true),
    listaHobbies: List.empty(growable: true),
    endereco: Endereco(moroEm: "", cidade: "", estado: "", pais: ""),
    dadosEmprego: Emprego(cargo: "", empresa: "", cidade: ""),
  );
}
