import 'package:flutter/material.dart';
import 'package:projeto_final_unb/telas/TelaCurtirFoto.dart';

class TelaCurtir extends StatefulWidget {
  TelaCurtir({Key? key}) : super(key: key);

  @override
  State<TelaCurtir> createState() => _TelaCurtirState();
}

class _TelaCurtirState extends State<TelaCurtir> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CurtirFoto()));
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
