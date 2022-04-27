import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/widgets/Anexo.dart';
import 'package:projeto_final_unb/widgets/GenerateUserText.dart';

class PerfilPrivado extends StatelessWidget {
  Usuario? user;
  PerfilPrivado({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white12,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(children: [
                Text("Perfil",
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: 1.5,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )),
                user!.fotoPerfil != null
                    ? Anexo(
                        largura: 200, altura: 200, picture: user!.fotoPerfil)
                    : _semFoto(),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock),
                    Text(
                      "Este perfil é privado.",
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _semFoto() => Padding(
      padding: const EdgeInsets.all(12.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        radius: 100,
        child: Icon(
          Icons.person,
          size: 150,
        ),
      ),
    );
