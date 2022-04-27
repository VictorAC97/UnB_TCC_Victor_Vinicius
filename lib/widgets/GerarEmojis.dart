import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingImage.dart';
import '../utilities/emojisList.dart';
import '../telas/TelaCurtirFoto.dart';
import '../widgets/asset_player_widget.dart';

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
    //emojis = [];
    getEmojis();
    randomizePositions(emojis);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: emojis
          .map((emoji) => InkWell(
                splashColor: Colors.blue,
                onTap: emoji != widget.emojiCorreto
                    ? () {
                        setState(() {
                          tentativas++;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('RESPOSTA INCORRETA!'),
                                ])));
                      }
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("PARABÉNS!"),
                              content: AssetPlayerWidget(
                                  videoPath:
                                      "assets/videos/Organizar_DeuCertoVcAcertou1.3gp"),
                              //const Text("VOCÊ ACERTOU"),
                              actions: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.black)),
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
