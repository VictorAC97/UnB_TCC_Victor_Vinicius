import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaConfiguracoesModulo2.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaInstrucoesModulo2.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaComentar.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaCompartilhar.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaTarefaCurtir.dart';
import 'package:projeto_final_unb/widgets/custom_bottom_app_bar_widget.dart';

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
        leftButtonText: 'Página Anterior',
        rightButtonText: 'Próxima Página',
      ), //bottomBar(),
    );
  }
}
