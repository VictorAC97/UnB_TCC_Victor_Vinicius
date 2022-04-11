import 'package:flutter/material.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingButton.dart';

import 'GerarEmojis.dart';

class CurtirFoto extends StatefulWidget {
  const CurtirFoto({Key? key}) : super(key: key);

  @override
  State<CurtirFoto> createState() => _CurtirFotoState();
}

class _CurtirFotoState extends State<CurtirFoto> {
  int tentativas = 0;
  bool visivel = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/imagensCurtir/funny.jpg",
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        visivel = !visivel;
                      });
                    },
                    icon: Icon(Icons.thumb_up),
                    label: Text(
                      "Curtir",
                    )),
              ),
              if (visivel == true) GerarEmojis(),
              MyBlinkingButton(),
            ],
          ),
        ));
  }
}
