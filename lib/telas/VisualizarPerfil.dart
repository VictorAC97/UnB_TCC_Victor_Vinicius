import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/Perfil.dart';
import 'package:projeto_final_unb/telas/PerfilPrivado.dart';

class VisualizarPerfil extends StatelessWidget {
  Usuario? user;
  VisualizarPerfil({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text("VISUALIZAR MEU PERFIL"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      */
      body: user!.isPublic == true
          ? Perfil(
              user: user,
            )
          //talvez sera removido, a depender do feedback da professora. (LOGICA ANTIGA)
          : PerfilPrivado(
              user: user,
            ),
    );
  }
}
