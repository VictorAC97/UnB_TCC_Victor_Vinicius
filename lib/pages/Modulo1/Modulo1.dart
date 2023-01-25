import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/Perfil.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaInstrucoesModulo1.dart';
import 'package:projeto_final_unb/widgets/custom_bottom_app_bar_widget.dart';

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
        leftButtonText: 'Página Anterior',
        rightButtonText: 'Próxima Página',
      ), //bottomBar(2),
    );
  }
}
