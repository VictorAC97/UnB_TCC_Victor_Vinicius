import 'package:flutter/material.dart';
import 'package:projeto_final_unb/utilities/conceitosList.dart';
import 'package:projeto_final_unb/widgets/custom_bottom_app_bar_widget.dart';
import '../widgets/botoes_tarefa_curtir_widget.dart';

class TelaCurtirFoto extends StatefulWidget {
  int index;
  TelaCurtirFoto({Key? key, required this.index}) : super(key: key);

  @override
  State<TelaCurtirFoto> createState() => _TelaCurtirFotoState();
}

late PageController _controller;

class _TelaCurtirFotoState extends State<TelaCurtirFoto> {
  var currentIndexPage = 0;
  @override
  void initState() {
    _controller = PageController(initialPage: currentIndexPage);
    super.initState();
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
          backgroundColor: Colors.black,
          title: Text("CONCEITO ${conceitosList[widget.index]['conceito']}"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndexPage = index;
                      });
                    },
                    itemCount: conceitosList[widget.index]['fotos'].length,
                    itemBuilder: (context, index) {
                      return ImagemBotoesWidget(
                        index: index,
                        indexConceitoList: widget.index,
                      );
                    }),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomAppBar(
          pagesQuantity: 3,
          currentIndexPage: currentIndexPage,
          pageController: _controller,
          leftButtonText: 'Imagem Anterior',
          rightButtonText: 'Próxima Imagem',
        ) //bottomBar(),
        );
  }
}
