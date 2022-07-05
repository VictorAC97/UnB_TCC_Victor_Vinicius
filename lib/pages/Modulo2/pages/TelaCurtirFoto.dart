import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/gerar_emojis_widget.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingButton.dart';

class CurtirFoto extends StatefulWidget {
  String? image;
  String? emoji;

  CurtirFoto({Key? key, this.image, this.emoji}) : super(key: key);

  @override
  State<CurtirFoto> createState() => _CurtirFotoState();
}

class _CurtirFotoState extends State<CurtirFoto> {
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 32),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Image.asset(
                    "assets/images/imagensCurtir/${widget.image}",
                  ),
                  onTap: () {
                    setState(() {
                      if (visivel == false) {
                        wrongTap = true;
                      }
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      icon: const Icon(Icons.comment),
                      label: const Text("Comentar"),
                      onPressed: () {
                        setState(() {
                          if (visivel == false) {
                            wrongTap = true;
                          }
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: wrongTap == true
                          ? MyBlinkingButton(
                              label: const Text("Curtir"),
                              icon: const Icon(Icons.thumb_up),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              onPressed: () {
                                setState(() {
                                  visivel = !visivel;
                                  wrongTap = false;
                                });
                              },
                            )
                          : TextButton.icon(
                              style: ButtonStyle(
                                  foregroundColor: visivel == true
                                      ? MaterialStateProperty.all(Colors.grey)
                                      : MaterialStateProperty.all(
                                          Colors.black)),
                              icon: const Icon(Icons.thumb_up),
                              label: const Text("Curtir"),
                              onPressed: () {
                                setState(() {
                                  visivel = !visivel;
                                });
                              },
                            ),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.share),
                      label: const Text("Compartilhar"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        setState(() {
                          if (visivel == false) {
                            wrongTap = true;
                          }
                        });
                      },
                    ),
                  ],
                ),
                AnimatedContainer(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  duration: const Duration(seconds: 1),
                  height: isVisible(visivel),
                  curve: Curves.bounceOut,
                  child: SingleChildScrollView(
                    child: GerarEmojis(
                      emojiCorreto: widget.emoji,
                      nomeFoto: widget.image,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

double? isVisible(bool status) {
  if (status == true) {
    return 100;
  } else {
    return 0;
  }
}
