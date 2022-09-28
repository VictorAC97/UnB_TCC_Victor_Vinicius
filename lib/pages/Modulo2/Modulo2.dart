import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaConfiguracoesModulo2.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaInstrucoesModulo2.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaComentar.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaCompartilhar.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaCurtir.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Modulo2 extends StatefulWidget {
  Usuario? user;
  AppSettings? appSettings;
  Modulo2({Key? key, required this.user, required this.appSettings})
      : super(key: key);

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
            currentIndexPage = index;
            _pageController.animateToPage(currentIndexPage,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          },
          children: [
            const TelaInstrucoesModulo2(),
            TelaConfiguracoesModulo2(appSettings: widget.appSettings!),
            const TelaTarefaCurtir(),
            TelaTarefaComentar(user: widget.user!),
            TelaTarefaCompartilhar(user: widget.user!),
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
                setState(() {});
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
              foregroundColor: MaterialStateProperty.all(
                  currentIndexPage < 4 ? Colors.black : Colors.grey.shade400),
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
