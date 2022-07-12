import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo2/pages/TelaFeedNoticias.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/compartilhar_widget.dart';
import 'package:projeto_final_unb/utilities/picturesList.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingButton.dart';

class TelaTarefaCompartilhar extends StatefulWidget {
  final Usuario user;
  const TelaTarefaCompartilhar({Key? key, required this.user})
      : super(key: key);

  @override
  State<TelaTarefaCompartilhar> createState() => _TelaTarefaCompartilharState();
}

String getRandomPicture() {
  String pictureName;
  Random random = Random();
  int index = random.nextInt(picturesList.length);
  pictureName = picturesList[index];
  return pictureName;
}

String picture = '';

class _TelaTarefaCompartilharState extends State<TelaTarefaCompartilhar> {
  @override
  void initState() {
    picture = getRandomPicture();
    super.initState();
  }

  bool wrongTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "LIÇÃO COMPARTILHAR",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 1),
              const Padding(padding: EdgeInsets.all(4)),
              GestureDetector(
                  child: Image.asset(
                    "assets/images/imagensCurtir/$picture",
                  ),
                  onTap: wrongTapFunc),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.comment),
                    label: const Text("Comentar"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: wrongTapFunc,
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.thumb_up),
                    label: const Text("Curtir"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: wrongTapFunc,
                  ),
                  wrongTap == false
                      ? TextButton.icon(
                          icon: const Icon(Icons.share),
                          label: const Text("Compartilhar"),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => CompartilharWidget(
                                pictureName: picture,
                                user: widget.user,
                              ),
                            );
                          },
                        )
                      : MyBlinkingButton(
                          onPressed: () {
                            setState(() {
                              wrongTap = false;
                            });
                            showDialog(
                              context: context,
                              builder: (context) => CompartilharWidget(
                                pictureName: picture,
                                user: widget.user,
                              ),
                            );
                          },
                          label: const Text("Compartilhar"),
                          icon: const Icon(Icons.share),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TelaFeedNoticias(user: widget.user)));
        },
        label: const Text('Feed de Noticias'),
        backgroundColor: Colors.black,
      ),
    );
  }

  wrongTapFunc() {
    setState(() {
      wrongTap = true;
    });
  }
}
