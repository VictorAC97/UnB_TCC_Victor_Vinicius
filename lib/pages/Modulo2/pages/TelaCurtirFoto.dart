import 'package:flutter/material.dart';
import 'package:projeto_final_unb/utilities/conceitosList.dart';
import 'package:projeto_final_unb/widgets/custom_bottom_app_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widgets/imagem_botoes_widget.dart';

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
        ) //bottomBar(),
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
                Text('Imagem Anterior'.toUpperCase()),
              ],
            ),
            icon: const SizedBox(),
            onPressed: () {
              if (currentIndexPage > 0) {
                currentIndexPage--;
                _controller.animateToPage(currentIndexPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
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
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.arrow_forward),
                Text('Próxima Imagem'.toUpperCase()),
              ],
            ),
            icon: const SizedBox(),
            onPressed: () {
              if (currentIndexPage < 2) {
                currentIndexPage++;
                _controller.animateToPage(currentIndexPage,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              }
            },
          ),
        ],
      ),
    );
  }
}
