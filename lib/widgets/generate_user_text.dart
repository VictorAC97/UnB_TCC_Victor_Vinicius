import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import '../utilities/monthsInYear.dart';

class GenerateUserText extends StatelessWidget {
  Usuario? user;
  TextStyle? textStyle;
  GenerateUserText({Key? key, this.user, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SelectableText(
          _text(),
          style: textStyle,
        ),
      ],
    );
  }

  String _text() {
    List<String> texto = [
      "Meu nome é ${user!.nome}, tenho ${user!.idade} anos e nasci no dia ${user!.dataNasc!.day} do mês de ${mesesDoAno[user!.dataNasc!.month]} do ano de ${user!.dataNasc!.year}. Minha altura é ${user!.alturaMetro} metro(s) e ${user!.alturaCentimetro} centimetros e tenho ${user!.pesoQuilos} quilos e ${user!.pesoGramas} gramas de peso. A respeito da minha personalidade, eu sou ${user!.listaEuSou!.join(", ")}."
    ];
    if (user!.listaMinhaCorPele!.isNotEmpty)
      texto.add("A cor da minha pele é ${user!.listaMinhaCorPele!.join()}.");

    if (user!.listaCorOlhos!.isNotEmpty)
      texto.add("A cor dos meus olhos é ${user!.listaCorOlhos!.join()}.");

    if (user!.listaMinhaComidaPreferida!.isNotEmpty)
      texto.add(
          "A minha comida preferida é ${user!.listaMinhaComidaPreferida!.join(", ")}.");
    if (user!.listaGostoDe!.isNotEmpty && user!.listaNaoGostoDe!.isNotEmpty)
      texto.add(
          "Eu gosto de ${user!.listaGostoDe!.join(", ")} e não gosto de ${user!.listaNaoGostoDe!.join(", ")}.");
    else if (user!.listaGostoDe!.isNotEmpty)
      texto.add("Eu gosto de ${user!.listaGostoDe!.join(", ")}.");
    else if (user!.listaNaoGostoDe!.isNotEmpty)
      texto.add("Eu Não gosto de ${user!.listaNaoGostoDe!.join(", ")}.");

    if (user!.listaCorPreferida!.isNotEmpty && user!.listaSigno!.isNotEmpty)
      texto.add(
          "A minha cor preferida é ${user!.listaCorPreferida!.join(", ")} e meu signo é ${user!.listaSigno!.join(", ")}.");
    else if (user!.listaCorPreferida!.isNotEmpty)
      texto.add(
          "A minha cor preferida é ${user!.listaCorPreferida!.join(", ")}.");
    else if (user!.listaSigno!.isNotEmpty)
      texto.add("Meu signo é ${user!.listaSigno!.join(", ")}.");

    return texto.join(" ").toString().toUpperCase();
  }
}
