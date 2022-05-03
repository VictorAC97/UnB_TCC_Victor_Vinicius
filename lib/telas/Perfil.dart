import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/widgets/Anexo.dart';
import 'package:projeto_final_unb/widgets/generate_user_text.dart';

class Perfil extends StatelessWidget {
  Usuario? user;
  Perfil({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                children: [
                  const Text("Perfil",
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
                  const Padding(
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
                    child: user!.nome == "" ||
                            user!.idade == "" ||
                            user!.alturaMetro == "" ||
                            user!.alturaCentimetro == "" ||
                            user!.pesoQuilos == "" ||
                            user!.pesoGramas == "" ||
                            user!.listaEuSou!.isEmpty == true
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "AGUARDANDO INFORMAÇÕES OBRIGATÓRIAS. . .",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              SizedBox(
                                  width: 270, child: LinearProgressIndicator()),
                            ],
                          )
                        : GenerateUserText(
                            user: user,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                  ),
                  const Divider(thickness: 1),
                  Text("MEU TRABALHO", style: _estiloTitulo()),
                  const Padding(padding: EdgeInsets.all(2)),
                  if (user!.dadosEmprego!.empresa != "")
                    Text(
                      "Eu trabalho na empresa ${user!.dadosEmprego!.empresa}, como ${user!.dadosEmprego!.cargo} em ${user!.dadosEmprego!.cidade}."
                          .toUpperCase(),
                    ),
                  const Divider(thickness: 1),
                  Text("ESCOLARIDADE", style: _estiloTitulo()),
                  const Padding(padding: EdgeInsets.all(2)),
                  if (user!.listaEscolaridade != "")
                    Text(user!.listaEscolaridade!.join(", ")),
                  const Divider(thickness: 1),
                  Text("LOCALIDADE", style: _estiloTitulo()),
                  const Padding(padding: EdgeInsets.all(2)),
                  if (user!.endereco!.moroEm != "")
                    Text("MORO EM ${user!.endereco!.moroEm!}."),
                  const Padding(padding: EdgeInsets.all(4)),
                  if (user!.endereco!.pais != "" &&
                      user!.endereco!.cidade != "" &&
                      user!.endereco!.estado != "")
                    Column(children: [
                      Text("SOU DA CIDADE: ${user!.endereco!.cidade}"),
                      Text("ESTADO: ${user!.endereco!.estado}"),
                      Text("PAÍS: ${user!.endereco!.pais}"),
                    ]),
                  const Divider(thickness: 1),
                  Text("STATUS DE RELACIONAMENTO", style: _estiloTitulo()),
                  const Padding(padding: EdgeInsets.all(2)),
                  if (user!.relacionamento != null)
                    Text("${user!.relacionamento}"),
                  const Divider(thickness: 1),
                  Text("TELEFONE", style: _estiloTitulo()),
                  const Padding(padding: EdgeInsets.all(2)),
                  if (user!.telefone != " ") Text("${user!.telefone}"),
                  const Divider(thickness: 1),
                  Text("MEUS HOBBIES", style: _estiloTitulo()),
                  const Padding(padding: EdgeInsets.all(2)),
                  if (user!.listaHobbies != null)
                    Text("${user!.listaHobbies!.join(", ")}"),
                  const Divider(thickness: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle? _estiloTitulo() => TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );

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
