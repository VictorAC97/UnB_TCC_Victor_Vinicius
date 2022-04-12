import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/TelaCriacaoTexto.dart';
import 'package:projeto_final_unb/telas/TelaDadosPublicosPrivados.dart';
import 'package:projeto_final_unb/telas/TelaObterFoto.dart';
import 'package:projeto_final_unb/telas/TelaObterFoto.dart';
import 'package:projeto_final_unb/telas/VisualizarPerfil.dart';
import 'package:projeto_final_unb/telas/VisualizarPerfil.dart';

import 'TelaObterFoto.dart';

class Modulo1 extends StatefulWidget {
  Usuario? user;
  Modulo1({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo1> createState() => _Modulo1State();
}

late PageController _pageController;

class _Modulo1State extends State<Modulo1> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("MÓDULO 1 - Edição de Perfil"),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          TelaObterFoto(user: widget.user),
          TelaCriacaoTexto(user: widget.user),
          TelaDadosPublicosPrivados(user: widget.user),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              iconSize: 35,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                iconSize: 35,
                onPressed: () {}),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Visualizar o perfil",
        backgroundColor: Colors.black,
        child: Icon(
          Icons.person,
          size: 40,
        ),
        onPressed: () {
          widget.user!.listaHobbies == null
              ? () {}
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VisualizarPerfil(user: widget.user)));
        },
      ),
    );
  }
}
