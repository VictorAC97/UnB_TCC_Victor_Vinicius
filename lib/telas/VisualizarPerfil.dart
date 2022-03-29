import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';

class VisualizarPerfil extends StatelessWidget {
  Usuario? user;
  VisualizarPerfil({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _controllerPage = PageController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Visualizar Perfil",
        ),
      ),
      body: PageView(
        controller: _controllerPage,
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}
