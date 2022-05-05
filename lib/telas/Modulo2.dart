import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/TelaTarefaComentar.dart';
import 'package:projeto_final_unb/telas/TelaTarefaCompartilhar.dart';
import 'package:projeto_final_unb/telas/TelaTarefaCurtir.dart';

class Modulo2 extends StatefulWidget {
  Usuario? user;
  Modulo2({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo2> createState() => _Modulo2State();
}

int _currentIndex = 0;

List pages = [
  TelaTarefaCurtir(),
  TelaTarefaComentar(),
  TelaTarefaCompartilhar(),
];

class _Modulo2State extends State<Modulo2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("MÓDULO 2 - Significado dos Emojis"),
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
              selectedIcon: Icon(Icons.thumb_up_alt_outlined),
              icon: Icon(Icons.thumb_up),
              label: "CURTIR",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.comment_outlined),
              icon: Icon(Icons.comment),
              label: "COMENTAR",
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.share_outlined),
              icon: Icon(Icons.share),
              label: "COMPARTILHAR",
            ),
          ],
        ),
      ),
    );
  }
}
