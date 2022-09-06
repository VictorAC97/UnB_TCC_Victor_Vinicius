import 'package:flutter/material.dart';
import 'package:projeto_final_unb/utilities/conceitosList.dart';
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
  @override
  void initState() {
    _controller = PageController();
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
                  itemCount: conceitosList[widget.index]['fotos'].length,
                  itemBuilder: (context, index) {
                    return ImagemBotoesWidget(
                      index: index,
                      indexConceitoList: widget.index,
                    );
                  }),
            ),
          ),
          Flexible(
            flex: 1,
            child: SmoothPageIndicator(
              controller: _controller,
              count: conceitosList[widget.index]['fotos'].length,
              effect: SwapEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Colors.black,
                dotColor: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
