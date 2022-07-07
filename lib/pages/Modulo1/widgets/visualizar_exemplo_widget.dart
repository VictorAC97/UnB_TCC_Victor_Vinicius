import 'package:flutter/material.dart';

class VisualizarExemplo extends StatelessWidget {
  final String image;
  final String nomeExemplo;
  const VisualizarExemplo(
      {Key? key, required this.image, required this.nomeExemplo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(nomeExemplo),
      content: Image.asset(
        'assets/images/sugestoes/$image',
        height: 300,
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 200,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('VOLTAR'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}
