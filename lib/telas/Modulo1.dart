import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/TelaCriacaoTexto.dart';
import 'package:projeto_final_unb/telas/TelaDadosPublicosPrivados.dart';
import 'package:projeto_final_unb/telas/TelaObterFoto.dart';
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

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      TelaObterFoto(user: widget.user),
      TelaCriacaoTexto(user: widget.user),
      TelaDadosPublicosPrivados(user: widget.user),
      VisualizarPerfil(user: widget.user),
    ];
    return Scaffold(
      //extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("MÓDULO 1 - Edição de Perfil"),
      ),
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.grey.withOpacity(0.3)),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 64,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.photo_camera_outlined),
              icon: Icon(Icons.photo_camera),
              label: "FOTO",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.text_snippet_outlined),
              icon: Icon(Icons.text_snippet),
              label: "TEXTO",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.privacy_tip_outlined),
              icon: Icon(Icons.privacy_tip),
              label: "DADOS",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person_outlined),
              icon: Icon(Icons.person),
              label: "PERFIL",
            ),
          ],
        ),
      ),
    );
  }
}

const TextStyle _textStyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontStyle: FontStyle.italic,
);
