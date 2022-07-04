import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/AcertosCurtidasNotifier.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingImage.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/feedback_foto_curtida.dart';
import '../../../utilities/emojisList.dart';
import 'package:provider/provider.dart';

class GerarEmojis extends StatefulWidget {
  final String? emojiCorreto;
  final String? nomeFoto;
  const GerarEmojis({Key? key, this.emojiCorreto, this.nomeFoto})
      : super(key: key);

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
    getEmojis();
    randomizePositions(emojis);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSettings appSettings = AppSettings();
    var acerto = context.watch<AcertosCurtidasNotifier>();

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
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.red,
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('RESPOSTA INCORRETA!'),
                                ])));
                      }
                    : () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return FeedBackFotoCurtida(
                              appSettings: appSettings,
                            );
                          },
                        );
                        acerto.addAcerto(widget.nomeFoto!);
                      },
                child: SizedBox(
                  child: tentativas >= 2 && emoji == widget.emojiCorreto
                      ? MyBlinkingImage(path: "assets/images/emojis/$emoji")
                      : Image.asset("assets/images/emojis/$emoji"),
                  width: 100,
                ),
              ))
          .toList(),
    );
  }
}
