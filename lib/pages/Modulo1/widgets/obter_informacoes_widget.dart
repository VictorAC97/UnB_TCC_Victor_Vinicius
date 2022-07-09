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
  int paginaAtual = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Dialog(
        child: Column(
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
                onPageChanged: (index) {
                  setState(() {
                    paginaAtual = index;
                  });
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: SwapEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        activeDotColor: Colors.black,
                        dotColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context, widget.user);
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: const Text("RETORNAR")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
