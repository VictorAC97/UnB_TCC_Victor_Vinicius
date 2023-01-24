import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/Perfil.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaInstrucoesModulo1.dart';
import 'package:projeto_final_unb/widgets/custom_bottom_app_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Modulo1 extends StatefulWidget {
  Usuario? user;
  Modulo1({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo1> createState() => _Modulo1State();
}

late PageController _pageController;

class _Modulo1State extends State<Modulo1> {
  int currentIndexPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndexPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("MÓDULO 1"),
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
            const TelaInstrucoesModulo1(),
            Perfil(user: widget.user),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        pagesQuantity: 2,
        currentIndexPage: currentIndexPage,
        pageController: _pageController,
      ), //bottomBar(2),
    );
  }

  Widget bottomBar(int pageQuantity) {
    int qtdPaginas = pageQuantity;
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: currentIndexPage == 0
                  ? MaterialStateProperty.all(Colors.transparent)
                  : MaterialStateProperty.all(Colors.black),
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
                setState(() {
                  currentIndexPage--;
                });
                _pageController.animateToPage(currentIndexPage,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear);
              }
            },
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: SwapEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Colors.black,
              dotColor: Colors.grey.shade300,
            ),
          ),
          TextButton.icon(
            style: ButtonStyle(
              foregroundColor: currentIndexPage < qtdPaginas - 1
                  ? MaterialStateProperty.all(Colors.black)
                  : MaterialStateProperty.all(Colors.transparent),
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
              if (currentIndexPage < qtdPaginas - 1) {
                setState(() {
                  currentIndexPage++;
                });

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
