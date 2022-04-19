import 'package:flutter/material.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingButton.dart';

import '../widgets/GerarEmojis.dart';

class CurtirFoto extends StatefulWidget {
  String? image;
  String? emoji;
  CurtirFoto({Key? key, this.image, this.emoji}) : super(key: key);

  @override
  State<CurtirFoto> createState() => _CurtirFotoState();
}

class _CurtirFotoState extends State<CurtirFoto> {
  Color? _corFundo = Colors.grey[300];
  double _myHeight = 0;
  bool visivel = false;
  bool wrongTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("CURTIR FOTO"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 32),
          child: Container(
            padding: EdgeInsets.all(16),
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
                      icon: Icon(Icons.comment),
                      label: Text("Comentar"),
                      onPressed: () {
                        setState(() {
                          if (visivel == false) {
                            wrongTap = true;
                          }
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: wrongTap == true
                          ? MyBlinkingButton(
                              label: Text("Curtir"),
                              icon: Icon(Icons.thumb_up),
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
                              icon: Icon(Icons.thumb_up),
                              label: Text("Curtir"),
                              onPressed: () {
                                setState(() {
                                  visivel = !visivel;
                                });
                              },
                            ),
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.share),
                      label: Text("Compartilhar"),
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
                    color: _corFundo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  duration: Duration(seconds: 1),
                  height: isVisible(visivel),
                  curve: Curves.bounceOut,
                  child: SingleChildScrollView(
                    child: GerarEmojis(
                      emojiCorreto: widget.emoji,
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
