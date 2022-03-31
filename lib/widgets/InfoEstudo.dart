import 'package:flutter/material.dart';

class InfoEstudo extends StatefulWidget {
  InfoEstudo({Key? key}) : super(key: key);

  @override
  State<InfoEstudo> createState() => _InfoEstudoState();
}

class _InfoEstudoState extends State<InfoEstudo> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("ONDE ESTUDO"),
      content: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Limpar",
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "Cancelar",
              style: TextStyle(color: Colors.black),
            )),
        ElevatedButton(
          onPressed: () {},
          child: Text("Finalizar"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
        ),
      ],
    );
  }
}
