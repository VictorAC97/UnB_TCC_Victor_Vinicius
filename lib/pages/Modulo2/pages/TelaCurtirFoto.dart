import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/imagem_botoes_widget.dart';
import 'package:projeto_final_unb/utilities/pictureAndEmoji.dart';

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
    _controller = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool visivel = false;
  bool wrongTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("CURTIR FOTO"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: PageView.builder(
            controller: _controller,
            itemCount: fotoEemoji.length,
            itemBuilder: (context, index) {
              return ImagemBotoesWidget(
                index: index,
              );
            }),
      ),
    );
  }
}

double? isVisible(bool status) {
  if (status == true) {
    return 100;
  } else {
    return 0;
  }
}
