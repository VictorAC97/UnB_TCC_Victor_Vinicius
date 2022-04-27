import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import '../utilities/monthsInYear.dart';

class GenerateUserText extends StatelessWidget {
  Usuario? user;
  TextStyle? textStyle;
  GenerateUserText({Key? key, this.user, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectableText(
          "Meu nome é ${user!.nome}, tenho ${user!.idade} anos e nasci no dia ${user!.dataNasc!.day} do mês de ${mesesDoAno[user!.dataNasc!.month]} do ano de ${user!.dataNasc!.year}. Minha altura é ${user!.alturaMetro} metro(s) e ${user!.alturaCentimetro} centimetros e tenho ${user!.pesoQuilos} quilos e ${user!.pesoGramas} gramas de peso. \nEu sou ${user!.listaEuSou!.join(", ")}. A cor da minha pele é ${user!.listaMinhaCorPele!.join()} e a cor dos meus olhos é ${user!.listaCorOlhos!.join()}. A minha comida preferida é ${user!.listaMinhaComidaPreferida!.join(", ")}. Eu gosto de ${user!.listaGostoDe!.join(", ")}. Porém não gosto de ${user!.listaNaoGostoDe!.join(", ")}. A minha cor preferida é ${user!.listaCorPreferida!.join(", ")} e meu signo é ${user!.listaSigno!.join(", ")}."
              .toUpperCase(),
          style: textStyle,
        ),
        //SE PRECISAR SEPARAR ALGO DO TEXTO QUE FOR OPTATIVO, AI DEVE IR CRIANDO OS SELECTABLETEXT DE CADA PARTE NESSA
      ],
    );
  }
}
