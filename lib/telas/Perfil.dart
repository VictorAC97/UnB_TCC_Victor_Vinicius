import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/widgets/Anexo.dart';
import 'package:projeto_final_unb/widgets/GenerateUserText.dart';

class Perfil extends StatelessWidget {
  Usuario? user;
  Perfil({Key? key, this.user}) : super(key: key);

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
              Column(
                children: [
                  Text("Perfil",
                      style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1.5,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Anexo(largura: 200, altura: 200, picture: user!.fotoPerfil),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("SOBRE MIM",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 1.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: GenerateUserText(
                      user: user,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Divider(thickness: 1),
                  Text("MEU TRABALHO",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Padding(padding: EdgeInsets.all(2)),
                  Text(
                    "Eu trabalho na empresa ${user!.dadosEmprego!.empresa}, como ${user!.dadosEmprego!.cargo} em ${user!.dadosEmprego!.cidade}."
                        .toUpperCase(),
                  ),
                  Divider(thickness: 1),
                  Text("ESCOLARIDADE",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Padding(padding: EdgeInsets.all(2)),
                  Text(user!.listaEscolaridade!.join(", ")),
                  Divider(thickness: 1),
                  Text("LOCALIDADE",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Padding(padding: EdgeInsets.all(2)),
                  Text(
                    "MORO EM ${user!.endereco!.moroEm!}.",
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Text("SOU DA CIDADE: ${user!.endereco!.cidade}"),
                  Text("ESTADO: ${user!.endereco!.estado}"),
                  Text("PAÍS: ${user!.endereco!.pais}"),
                  Divider(thickness: 1),
                  Text("STATUS DE RELACIONAMENTO",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Padding(padding: EdgeInsets.all(2)),
                  Text("${user!.relacionamento}"),
                  Divider(thickness: 1),
                  Text("TELEFONE",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Padding(padding: EdgeInsets.all(2)),
                  Text("${user!.telefone}"),
                  Divider(thickness: 1),
                  Text("MEUS HOBBIES",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Padding(padding: EdgeInsets.all(2)),
                  Text("${user!.listaHobbies!.join(", ")}"),
                  Divider(thickness: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
