import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingImage.dart';
import '../utilities/emojisList.dart';

class GerarEmojis extends StatefulWidget {
  final String? emojiCorreto;
  const GerarEmojis({Key? key, this.emojiCorreto}) : super(key: key);

  @override
  State<GerarEmojis> createState() => _GerarEmojisState();
}

List<String> emojis = [];

randomizePositions(List<String> list) {
  list.shuffle();
}

List<String> generateWrongAnswers(String emojiCorreto) {
  int i = 0;
  List<String> wrongAnswers = [];
  Random random = Random();
  while (i < 2) {
    int position = random.nextInt(emojisList.length);
    if (emojisList[position] != emojiCorreto &&
        wrongAnswers.contains(emojisList[position]) == false) {
      wrongAnswers.add(emojisList[position]);
      i++;
    }
  }
  return wrongAnswers;
}

class _GerarEmojisState extends State<GerarEmojis> {
  int tentativas = 0;

  getEmojis() {
    emojis = generateWrongAnswers(widget.emojiCorreto!);
    emojis.add(widget.emojiCorreto!);
  }

  @override
  void initState() {
    emojis = [];
    getEmojis();
    randomizePositions(emojis);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: emojis
          .map((emoji) => GestureDetector(
                onTap: emoji != widget.emojiCorreto
                    ? () {
                        setState(() {
                          tentativas++;
                        });
                      }
                    : () {
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
                child: SizedBox(
                  child: tentativas >= 2 && emoji == widget.emojiCorreto
                      ? MyBlinkingImage(path: "assets/images/emojis/${emoji}")
                      : Image.asset("assets/images/emojis/${emoji}"),
                  width: 100,
                ),
              ))
          .toList(),
    );
  }
}
