import 'dart:math';

import 'package:projeto_final_unb/pages/Modulo3/utilities/ListaNaoPodeEscrever.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/ListaPodeEscrever.dart';

List<Map<String, dynamic>> gerarPalavrasFrases() {
  List<Map<String, dynamic>> sugestoes = [];
  var randomNum = Random();
  int i = 0;
  int j = 0;
  //acertos
  while (i < 3) {
    int num = randomNum.nextInt(listaPodeEscrever.length);
    if (!(sugestoes.contains(listaPodeEscrever[num]))) {
      sugestoes.add(listaPodeEscrever[num]);
      i++;
    }
  }
  //erros
  while (j < 3) {
    int numm = randomNum.nextInt(listaNaoPodeEscrever.length);
    if (!(sugestoes.contains(listaNaoPodeEscrever[numm]))) {
      sugestoes.add(listaNaoPodeEscrever[numm]);
      j++;
    }
  }
  sugestoes.shuffle();
  return sugestoes;
}
