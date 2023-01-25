import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaCriacaoTexto.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaDadosPublicosPrivados.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaObterFoto.dart';

import '../../../widgets/custom_bottom_app_bar_widget.dart';

class CadastroInformacoes extends StatefulWidget {
  final Usuario user;
  const CadastroInformacoes({Key? key, required this.user}) : super(key: key);

  @override
  State<CadastroInformacoes> createState() => _CadastroInformacoesState();
}

class _CadastroInformacoesState extends State<CadastroInformacoes> {
  late PageController _controller;
  int currentIndexPage = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentIndexPage);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CADASTRO DE INFORMAÇÕES'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leadingWidth: 50,
          leading: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context, widget.user)),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 10,
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndexPage = index;
                  });
                },
                children: [
                  TelaObterFoto(user: widget.user),
                  TelaCriacaoTexto(user: widget.user),
                  TelaDadosPublicosPrivados(user: widget.user),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomAppBar(
          pagesQuantity: 3,
          currentIndexPage: currentIndexPage,
          pageController: _controller,
          leftButtonText: 'Página Anterior',
          rightButtonText: 'Próxima Página',
        ), //bottomBar(),
      ),
    );
  }
}
