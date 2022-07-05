import 'package:flutter/material.dart';

class VisualizarExemplo extends StatelessWidget {
  final String image;
  const VisualizarExemplo({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('EXEMPLO'),
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
