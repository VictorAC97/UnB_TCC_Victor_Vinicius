import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaConfiguracoesModulo2.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaInstrucoesModulo2.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaComentar.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaCompartilhar.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaCurtir.dart';
import 'package:projeto_final_unb/widgets/custom_bottom_app_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Modulo2 extends StatefulWidget {
  Usuario? user;
  Modulo2({Key? key, required this.user}) : super(key: key);

  @override
  State<Modulo2> createState() => _Modulo2State();
}

late PageController _pageController;

class _Modulo2State extends State<Modulo2> {
  int currentIndexPage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndexPage);
    super.initState();
  }

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
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndexPage = index;
            });
          },
          children: [
            const TelaInstrucoesModulo2(),
            const TelaConfiguracoesModulo2(),
            const TelaTarefaCurtir(),
            TelaTarefaComentar(user: widget.user!),
            TelaTarefaCompartilhar(user: widget.user!),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        pagesQuantity: 5,
        currentIndexPage: currentIndexPage,
        pageController: _pageController,
      ), //bottomBar(),
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
            count: 5,
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
              if (currentIndexPage < 4) {
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
