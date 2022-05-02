import 'package:flutter/material.dart';
import 'package:projeto_final_unb/telas/TelaCurtirFoto.dart';
import '../utilities/pictureAndEmoji.dart';

class TelaTarefaCurtir extends StatefulWidget {
  TelaTarefaCurtir({Key? key}) : super(key: key);

  @override
  State<TelaTarefaCurtir> createState() => _TelaTarefaCurtirState();
}

class _TelaTarefaCurtirState extends State<TelaTarefaCurtir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: fotoEemoji.length,
          itemBuilder: (context, index) {
            //var infoFotoEemoji = fotoEemoji[index];

            return ListTile(
              title: Text("FOTO ${index + 1}: ${fotoEemoji[index]["tarefa"]}"),
              trailing: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurtirFoto(
                                image: fotoEemoji[index]["foto"],
                                emoji: fotoEemoji[index]["emoji"],
                              )));
                },
                icon: Icon(Icons.thumb_up),
                label: Text("Curtir"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
              ),
            );
          },
        ),
      ),
    );
  }
}
