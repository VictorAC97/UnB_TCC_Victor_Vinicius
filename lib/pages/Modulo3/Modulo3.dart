import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaConfigurarDificuldades.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodeEscrever.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodeEscreverDuploToque.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodePostarFoto.dart';
import 'package:projeto_final_unb/pages/Modulo3/pages/TelaTarefaPodePostarFotoDuploToque.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarFotos.dart';
import 'package:projeto_final_unb/pages/Modulo3/utilities/funcGerarPalavraFrase.dart';
import 'package:projeto_final_unb/widgets/custom_bottom_app_bar_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_settings.dart';
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
    var listaNomesFotos = gerarNomesFotos(2);
    var listaFrasesPalavras = gerarPalavrasFrases();
    List<Map<String, dynamic>> acertosFotos = [];
    List<Map<String, dynamic>> acertosFrasesPalavras = [];
    var dificuldade =
        context.watch<AppSettings>().infoDificuldade['dificuldade'];

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
        bottomNavigationBar: CustomBottomAppBar(
          pagesQuantity: 4,
          currentIndexPage: currentIndexPage,
          pageController: _pageController,
          leftButtonText: 'Página Anterior',
          rightButtonText: 'Próxima Página',
        ) //bottomBar(),
        );
  }
}
