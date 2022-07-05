import 'package:flutter/material.dart';

class PerfilPrivado extends StatelessWidget {
  const PerfilPrivado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.lock),
        Text(
          "Este perfil é privado.",
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }
}
