import 'package:flutter/material.dart';
import 'package:projeto_final_unb/telas/TelaCurtirFoto.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingImage.dart';

class GerarEmojis extends StatefulWidget {
  String? emojiCorreto;
  String? emojiErrado1;
  String? emojiErrado2;
  GerarEmojis(
      {Key? key, this.emojiCorreto, this.emojiErrado1, this.emojiErrado2})
      : super(key: key);

  @override
  State<GerarEmojis> createState() => _GerarEmojisState();
}

class _GerarEmojisState extends State<GerarEmojis> {
  int tentativas = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              tentativas++;
            });
          },
          child: SizedBox(
              width: 100,
              child: Image.asset(
                "assets/images/emojis/${widget.emojiErrado1}.png",
              )),
        ),
        GestureDetector(
          child: SizedBox(
            width: 100,
            child: tentativas < 2
                ? Image.asset("assets/images/emojis/${widget.emojiCorreto}.png")
                : MyBlinkingImage(
                    path: "assets/images/emojis/${widget.emojiCorreto}.png"),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("PARABÉNS!"),
                  content: const Text("VOCÊ ACERTOU"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tentativas = 0;
                          });

                          Navigator.pop(context);
                        },
                        child: const Text("OK")),
                  ],
                );
              },
            );
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              tentativas++;
            });
          },
          child: SizedBox(
              width: 100,
              child: Image.asset(
                  "assets/images/emojis/${widget.emojiErrado2}.png")),
        ),
      ],
    );
  }
}
