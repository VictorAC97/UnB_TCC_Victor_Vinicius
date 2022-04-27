import 'package:flutter/material.dart';
import 'package:projeto_final_unb/telas/TelaCurtirFoto.dart';

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
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Foto ${index + 1}"),
              trailing: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurtirFoto(
                                image: "funny.jpg",
                                emoji: "caraDandoRisada.png",
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