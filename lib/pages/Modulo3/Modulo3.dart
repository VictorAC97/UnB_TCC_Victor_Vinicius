import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodeEscrever.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodePostarFoto.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarFotos.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarPalavraFrase.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'pages/TelaInstrucoesModulo3.dart';

class Modulo3 extends StatefulWidget {
  Usuario? user;
  Modulo3({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo3> createState() => _Modulo3State();
}

late PageController _pageController;
int currentIndexPage = 0;

class _Modulo3State extends State<Modulo3> {
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
            setState(() {
              currentIndexPage = index;
            });

            _pageController.animateToPage(currentIndexPage,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          },
          children: [
            const TelaInstrucoesModulo3(),
            TelaTarefaPodePostarFoto(
              listaNomesFotos: listaNomesFotos,
              acertos: acertosFotos,
            ),
            TelaTarefaPodeEscrever(
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
              foregroundColor: MaterialStateProperty.all(
                  currentIndexPage > 0 ? Colors.black : Colors.grey.shade400),
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
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
                //setState(() {});
              }
            },
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: SwapEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.black,
              dotColor: Colors.grey.shade300,
            ),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  currentIndexPage < 2 ? Colors.black : Colors.grey.shade400),
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
              if (currentIndexPage < 2) {
                currentIndexPage++;
                _pageController.animateToPage(currentIndexPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
