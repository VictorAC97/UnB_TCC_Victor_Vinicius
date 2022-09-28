import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaCriacaoTexto.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaDadosPublicosPrivados.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaObterFoto.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ObterInformacoes extends StatefulWidget {
  final Usuario user;
  const ObterInformacoes({Key? key, required this.user}) : super(key: key);

  @override
  State<ObterInformacoes> createState() => _ObterInformacoesState();
}

class _ObterInformacoesState extends State<ObterInformacoes> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('CADASTRO DE INFORMAÇÕES'),
        backgroundColor: Colors.black,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, widget.user)),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 10,
            child: PageView(
              controller: _controller,
              children: [
                TelaObterFoto(user: widget.user),
                TelaCriacaoTexto(user: widget.user),
                TelaDadosPublicosPrivados(user: widget.user),
              ],
            ),
          ),
        ],
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
                _controller.animateToPage(currentIndexPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
                setState(() {});
              }
            },
          ),
          SmoothPageIndicator(
            controller: _controller,
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
                _controller.animateToPage(currentIndexPage,
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
