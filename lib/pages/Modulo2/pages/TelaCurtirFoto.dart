import 'package:flutter/material.dart';
import 'package:projeto_final_unb/utilities/conceitosList.dart';

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
      body: Container(
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
    );
  }
}
