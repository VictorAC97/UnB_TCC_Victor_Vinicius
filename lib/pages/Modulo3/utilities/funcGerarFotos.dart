import 'dart:math';
import 'package:projeto_final_unb/pages/Modulo3/utilities/ListaNaoPodePostar.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/ListaPodePostar.dart';

List<Map<String, dynamic>> gerarNomesFotos(int quantidade) {
  List<Map<String, dynamic>> nomesFotos = [];
  var randomNum = Random();
  int i = 0;
  int j = 0;
  //acertos
  while (i < quantidade / 2) {
    int num = randomNum.nextInt(listaPodePostar.length);
    if (!(nomesFotos.contains(listaPodePostar[num]))) {
      nomesFotos.add(listaPodePostar[num]);
      i++;
    }
  }
  //erros
  while (j < quantidade / 2) {
    int numm = randomNum.nextInt(listaNaoPodePostar.length);
    if (!(nomesFotos.contains(listaNaoPodePostar[numm]))) {
      nomesFotos.add(listaNaoPodePostar[numm]);
      j++;
    }
  }
  nomesFotos.shuffle();
  return nomesFotos;
}
