import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/TelaInstrucoesModulo1.dart';
import 'package:projeto_final_unb/telas/VisualizarPerfil.dart';

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

  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("MÓDULO 1 - Edição de Perfil"),
      ),
      body: Center(
        child: PageView(
          children: [
            const TelaInstrucoesModulo1(),
            VisualizarPerfil(user: widget.user),
            //TelaObterFoto(user: widget.user),
            //TelaCriacaoTexto(user: widget.user),
            //TelaDadosPublicosPrivados(user: widget.user),
          ],
        ),
      ),
      /* floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        icon: Icon(Icons.person),
        label: Text("PERFIL"),
        onPressed: (() => Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => VisualizarPerfil(user: widget.user)),
              ),
            )),
      ),
      */
    );
  }
}
