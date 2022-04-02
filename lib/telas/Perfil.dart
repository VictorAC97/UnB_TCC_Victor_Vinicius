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
                    child: Text("Sobre mim",
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
                    ),
                  ),
                  Divider(thickness: 1),
                  Text("Meu Trabalho",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(
                    "Eu trabalho na empresa ${user!.dadosEmprego!.empresa}, como ${user!.dadosEmprego!.cargo} em ${user!.dadosEmprego!.cidade}.",
                  ),
                  Divider(thickness: 1),
                  Text("Escolaridade",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(user!.listaEscolaridade!.join(", ")),
                  Divider(thickness: 1),
                  Text("Localidade",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(
                    "Moro em ${user!.endereco!.moroEm!}.",
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Text("SOU DA CIDADE: ${user!.endereco!.cidade}"),
                  Text("ESTADO: ${user!.endereco!.estado}"),
                  Text("PAÍS: ${user!.endereco!.pais}"),
                  Divider(thickness: 1),
                  Text("Status de Relacionamento",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Text("${user!.relacionamento}"),
                  Divider(thickness: 1),
                  Text("Telefone",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                  Text("${user!.telefone}"),
                  Divider(thickness: 1),
                  Text("Meus Hobbies",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
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
