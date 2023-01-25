import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/gerar_emojis_widget.dart';
import 'package:projeto_final_unb/utilities/conceitosList.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingButton.dart';

class ImagemBotoesWidget extends StatefulWidget {
  int index;
  int indexConceitoList;
  ImagemBotoesWidget(
      {Key? key, required this.index, required this.indexConceitoList})
      : super(key: key);

  @override
  State<ImagemBotoesWidget> createState() => _ImagemBotoesWidgetState();
}

class _ImagemBotoesWidgetState extends State<ImagemBotoesWidget> {
  bool visivel = false;
  bool wrongTap = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          child: Image.asset(
            "assets/images/imagensCurtir/${conceitosList[widget.indexConceitoList]['fotos'][widget.index]}",
            height: 300,
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
                  foregroundColor: visivel == true
                      ? MaterialStateProperty.all(Colors.grey)
                      : MaterialStateProperty.all(Colors.black)),
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
                          foregroundColor: visivel == true
                              ? MaterialStateProperty.all(Colors.black)
                              : MaterialStateProperty.all(Colors.grey)),
                      onPressed: () {
                        setState(() {
                          visivel = !visivel;
                          wrongTap = false;
                        });
                      },
                    )
                  : TextButton.icon(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black)),
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
                  foregroundColor: visivel == true
                      ? MaterialStateProperty.all(Colors.grey)
                      : MaterialStateProperty.all(Colors.black)),
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
              indexConceitoList: widget.indexConceitoList,
            ),
          ),
        ),
      ],
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
