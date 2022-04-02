import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/Perfil.dart';
import 'package:projeto_final_unb/telas/PerfilPrivado.dart';
import 'package:projeto_final_unb/widgets/Anexo.dart';
import 'package:projeto_final_unb/widgets/GenerateUserText.dart';

class VisualizarPerfil extends StatelessWidget {
  Usuario? user;
  VisualizarPerfil({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        if (user!.isPublic == true)
          Perfil(
            user: user,
          )
        else
          PerfilPrivado(
            user: user,
          ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
