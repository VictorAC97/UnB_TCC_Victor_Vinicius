import 'package:flutter/material.dart';

class GerarEmojis extends StatelessWidget {
  const GerarEmojis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: 100,
            child: Image.asset("assets/images/emojis/caraDePensativo.png")),
        GestureDetector(
          child: SizedBox(
              width: 100,
              child: Image.asset("assets/images/emojis/caraDandoRisada.png")),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("PARABÉNS!"),
                  content: Text("VOCÊ ACERTOU."),
                );
              },
            );
          },
        ),
        SizedBox(
            width: 100,
            child: Image.asset("assets/images/emojis/caraIrritado.png")),
      ],
    );
  }
}
