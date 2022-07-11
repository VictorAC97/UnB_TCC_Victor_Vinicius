import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo2/widgets/comentario_field_widget.dart';
import 'package:projeto_final_unb/utilities/picturesList.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingButton.dart';
import 'package:provider/provider.dart';
import '../../../models/ComentariosNotifier.dart';

class TelaTarefaComentar extends StatefulWidget {
  const TelaTarefaComentar({Key? key}) : super(key: key);

  @override
  State<TelaTarefaComentar> createState() => _TelaTarefaComentarState();
}

String getRandomPicture() {
  String pictureName;
  Random random = Random();
  int index = random.nextInt(picturesList.length);
  pictureName = picturesList[index];
  return pictureName;
}

class _TelaTarefaComentarState extends State<TelaTarefaComentar> {
  bool wrongTap = false;
  //String picture = getRandomPicture();
  String picture = 'feliz2.jpg';
  @override
  Widget build(BuildContext context) {
    var containerComentariosController = context.watch<ComentariosNotifier>();
    bool visivel = containerComentariosController.animationContainerVisible;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "LIÇÃO COMENTAR",
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
                  wrongTap == false
                      ? TextButton.icon(
                          icon: const Icon(Icons.comment),
                          label: const Text("Comentar"),
                          style: ButtonStyle(
                            foregroundColor: visivel == true
                                ? MaterialStateProperty.all(Colors.grey)
                                : MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            containerComentariosController.abrirContainer();
                            if (visivel == true) {
                              containerComentariosController.fecharContainer();
                            }
                          },
                        )
                      : MyBlinkingButton(
                          onPressed: () {
                            wrongTap = false;
                            containerComentariosController.abrirContainer();
                            if (visivel == true) {
                              containerComentariosController.fecharContainer();
                            }
                          },
                          label: const Text("Comentar"),
                          icon: const Icon(Icons.comment),
                          style: ButtonStyle(
                            foregroundColor: visivel == true
                                ? MaterialStateProperty.all(Colors.grey)
                                : MaterialStateProperty.all(Colors.black),
                          ),
                        ),
                  TextButton.icon(
                      icon: const Icon(Icons.thumb_up),
                      label: const Text("Curtir"),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: wrongTapFunc),
                  TextButton.icon(
                    icon: const Icon(Icons.share),
                    label: const Text("Compartilhar"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: wrongTapFunc,
                  ),
                ],
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                duration: const Duration(seconds: 1),
                height: isVisible(visivel),
                curve: Curves.bounceOut,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: ComentarioFieldWidget(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 380,
                width: MediaQuery.of(context).size.width,
                child: Consumer<ComentariosNotifier>(
                  builder: ((context, value, child) {
                    return ListView.builder(
                      itemCount: value.comentarios.length,
                      itemBuilder: ((context, index) => ListTile(
                            leading: Column(
                              children: const [
                                Icon(Icons.person),
                              ],
                            ),
                            title: const Text('Nome da pessoa'),
                            subtitle: Text(value.comentarios[index]),
                          )),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double? isVisible(bool status) {
    if (status == true) {
      return 210;
    } else {
      return 0;
    }
  }

  wrongTapFunc() {
    setState(() {
      wrongTap = true;
    });
  }
}
