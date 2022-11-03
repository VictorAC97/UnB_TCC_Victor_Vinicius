import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaConfigurarDificuldades.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodeEscrever.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodeEscreverDuploToque.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodePostarFoto.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodePostarFotoDuploToque.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarFotos.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarPalavraFrase.dart';
import 'package:projeto_final_unb/pages/Modulo3/widgets/DificuldadeNotifier.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

import 'pages/TelaInstrucoesModulo3.dart';

class Modulo3 extends StatefulWidget {
  Usuario? user;
  Modulo3({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo3> createState() => _Modulo3State();
}

late PageController _pageController;

class _Modulo3State extends State<Modulo3> {
  int currentIndexPage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndexPage);
  }

  @override
  Widget build(BuildContext context) {
    var listaNomesFotos = gerarNomesFotos();
    var listaFrasesPalavras = gerarPalavrasFrases();
    List<Map<String, dynamic>> acertosFotos = [];
    List<Map<String, dynamic>> acertosFrasesPalavras = [];
    var dificuldade = context.watch<DificuldadeNotifier>().dificuldade;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("MÓDULO 3"),
        centerTitle: true,
      ),
      body: Center(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            currentIndexPage = index;
          },
          children: [
            const TelaInstrucoesModulo3(),
            const TelaConfigurarDificuldades(),
            dificuldade == 'arrastar'
                ? TelaTarefaPodePostarFoto(
                    listaNomesFotos: listaNomesFotos,
                    acertos: acertosFotos,
                  )
                : TelaTarefaPodePostarFotoDuploToque(
                    listaNomesFotos: listaNomesFotos,
                    acertos: acertosFotos,
                  ),
            dificuldade == 'arrastar'
                ? TelaTarefaPodeEscrever(
                    listaFrasesPalavras: listaFrasesPalavras,
                    acertos: acertosFrasesPalavras,
                  )
                : TelaTarefaPodeEscreverDuploToque(
                    listaFrasesPalavras: listaFrasesPalavras,
                    acertos: acertosFrasesPalavras,
                  ),
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget bottomBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_back),
                Text('Página Anterior'.toUpperCase()),
              ],
            ),
            icon: const SizedBox(),
            onPressed: () {
              if (currentIndexPage > 0) {
                currentIndexPage--;
                _pageController.animateToPage(currentIndexPage,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear);
              }
            },
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 4,
            effect: SwapEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.black,
              dotColor: Colors.grey.shade300,
            ),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_forward),
                Text('Próxima Página'.toUpperCase()),
              ],
            ),
            icon: const SizedBox(),
            onPressed: () {
              if (currentIndexPage < 3) {
                currentIndexPage++;
                _pageController.animateToPage(currentIndexPage,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear);
              }
            },
          ),
        ],
      ),
    );
  }
}
