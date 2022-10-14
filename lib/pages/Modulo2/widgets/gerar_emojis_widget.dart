import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_final_unb/utilities/conceitosList.dart';
import 'package:projeto_final_unb/utilities/emojisList.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingImage.dart';
import 'package:projeto_final_unb/widgets/app_settings.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/feedback_foto_curtida_widget.dart';

class GerarEmojis extends StatefulWidget {
  int indexConceitoList;
  GerarEmojis({Key? key, required this.indexConceitoList}) : super(key: key);

  @override
  State<GerarEmojis> createState() => _GerarEmojisState();
}

List<String> emojis = [];

List<String> generateAnswers(int conceitoListIndex) {
  int i = 0;
  List<String> answers = [];
  int position;
  Random random = Random();
  //adicionar resposta correta
  position = random
      .nextInt(conceitosList[conceitoListIndex]['emojis-corretos'].length);
  answers.add(conceitosList[conceitoListIndex]['emojis-corretos'][position]);

  //adicionando respostas erradas
  while (i < 2) {
    position = random.nextInt(emojisList.length);
    if (!answers.contains(emojisList[position]) &&
        !conceitosList[conceitoListIndex]['emojis-corretos']
            .contains(emojisList[position])) {
      answers.add(emojisList[position]);
      i++;
    }
  }
  answers.shuffle();
  return answers;
}

class _GerarEmojisState extends State<GerarEmojis> {
  int tentativas = 0;

  getEmojis() {
    emojis = generateAnswers(widget.indexConceitoList);
  }

  @override
  void initState() {
    getEmojis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSettings appSettings = AppSettings();
    //var acerto = context.watch<AcertosCurtidasNotifier>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: emojis
          .map((emoji) => InkWell(
                splashColor: Colors.blue,
                onTap: conceitosList[widget.indexConceitoList]
                            ['emojis-corretos']
                        .contains(emoji)
                    ? () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return FeedBackFotoCurtida(
                              appSettings: appSettings,
                            );
                          },
                        );
                        //acerto.addAcerto(widget.nomeFoto!);
                      }
                    : () {
                        setState(() {
                          tentativas++;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.red,
                          content: Image.asset(
                            'assets/images/emojis/thumbDown.png',
                            height: 30,
                          ),
                        ));
                      },
                child: SizedBox(
                  child: tentativas >= 2 &&
                          conceitosList[widget.indexConceitoList]
                                  ['emojis-corretos']
                              .contains(emoji)
                      ? MyBlinkingImage(path: "assets/images/emojis/$emoji")
                      : Image.asset("assets/images/emojis/$emoji"),
                  width: 100,
                ),
              ))
          .toList(),
    );
  }
}
