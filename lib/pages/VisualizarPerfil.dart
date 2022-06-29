import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Perfil.dart';
import 'package:projeto_final_unb/pages/PerfilPrivado.dart';

class VisualizarPerfil extends StatelessWidget {
  Usuario? user;
  VisualizarPerfil({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: user!.isPublic == true
          ? Perfil(
              user: user,
            )
          : PerfilPrivado(
              user: user,
            ),
    );
  }
}
