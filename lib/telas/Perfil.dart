import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/PerfilPrivado.dart';
import 'package:projeto_final_unb/telas/TelaCriacaoTexto.dart';
import 'package:projeto_final_unb/telas/TelaDadosPublicosPrivados.dart';
import 'package:projeto_final_unb/telas/TelaObterFoto.dart';
import 'package:projeto_final_unb/widgets/Anexo.dart';
import 'package:projeto_final_unb/widgets/MyBlinkingButton.dart';
import 'package:projeto_final_unb/widgets/generate_user_text.dart';
import '../utilities/invalid_date.dart';

class Perfil extends StatefulWidget {
  Usuario? user;
  Perfil({Key? key, this.user}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 35,
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                child: widget.user!.fotoPerfil != null
                    ? Anexo(
                        largura: 200,
                        altura: 200,
                        picture: widget.user!.fotoPerfil)
                    : _semFoto(),
                onTap: () async {
                  widget.user = await showDialog(
                    context: context,
                    builder: (context) => WillPopScope(
                      // nao permite clicar fora do dialog p fechar, somente no botao retornar
                      onWillPop: () async {
                        if (!saved) {
                          return false;
                        } else
                          return true;
                      },
                      child: Dialog(
                        child: Column(
                          children: [
                            Flexible(
                              flex: 10,
                              child: PageView(children: [
                                TelaObterFoto(user: widget.user),
                                TelaCriacaoTexto(user: widget.user),
                                TelaDadosPublicosPrivados(user: widget.user),
                              ]),
                            ),
                            Flexible(
                              flex: 1,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context, widget.user);
                                  },
                                  child: Text("RETORNAR")),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  setState(() {}); //carrega a foto na tela de perfil
                },
              ),
              widget.user!.isPublic == false
                  ? privateProfile(widget.user!)
                  : publicProfile(widget.user!)
            ],
          ),
        ),
      ),
    );
  }

  TextStyle? _estiloTitulo() => const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );

  Widget _semFoto() => const Padding(
        padding: EdgeInsets.all(12.0),
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

  bool _isTextComplete(Usuario? user) {
    if (user!.nome == "" ||
        user.idade == "" ||
        isInvalidDate(user.dataNasc!) == true ||
        user.alturaMetro == "" ||
        user.alturaCentimetro == "" ||
        user.pesoQuilos == "" ||
        user.pesoGramas == "" ||
        user.listaEuSou!.isEmpty == true) {
      return false;
    } else {
      return true;
    }
  }

  Widget publicProfile(Usuario user) {
    setState(() {});
    return Column(
      children: [
        Container(
          child: _isTextComplete(user) == false
              ? Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "AGUARDANDO INFORMAÇÕES. . .",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: listarPendencias(),
                    ),
                    const SizedBox(
                        width: 270, child: LinearProgressIndicator()),
                  ],
                )
              : GenerateUserText(
                  user: widget.user,
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
        ),
        const Divider(thickness: 1),
        Text("MEU TRABALHO", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (widget.user!.dadosEmprego!.empresa != "")
          Text("${widget.user!.dadosEmprego!.empresa}".toUpperCase()),
        if (widget.user!.dadosEmprego!.cargo != "")
          Text("${widget.user!.dadosEmprego!.cargo}".toUpperCase()),
        if (widget.user!.dadosEmprego!.cidade != "")
          Text("${widget.user!.dadosEmprego!.cidade}".toUpperCase()),
        const Divider(thickness: 1),
        Text("ESCOLARIDADE", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (widget.user!.listaEscolaridade!.isNotEmpty)
          Text(widget.user!.listaEscolaridade!.join(", ")),
        const Divider(thickness: 1),
        Text("LOCALIDADE", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (widget.user!.endereco!.moroEm!.isNotEmpty)
          Text("MORO EM ${widget.user!.endereco!.moroEm!}."),
        const Padding(padding: EdgeInsets.all(4)),
        if (widget.user!.endereco!.pais!.isNotEmpty &&
            widget.user!.endereco!.cidade!.isNotEmpty &&
            widget.user!.endereco!.estado!.isNotEmpty)
          Column(children: [
            Text("SOU DA CIDADE: ${widget.user!.endereco!.cidade}"),
            Text("ESTADO: ${widget.user!.endereco!.estado}"),
            Text("PAÍS: ${widget.user!.endereco!.pais}"),
          ]),
        const Divider(thickness: 1),
        Text("STATUS DE RELACIONAMENTO", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (widget.user!.relacionamento!.isNotEmpty)
          Text("${widget.user!.relacionamento}"),
        const Divider(thickness: 1),
        Text("TELEFONE", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (widget.user!.telefone != "") Text("${widget.user!.telefone}"),
        const Divider(thickness: 1),
        Text("MEUS HOBBIES", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (widget.user!.listaHobbies!.isNotEmpty)
          Text(widget.user!.listaHobbies!.join(", ")),
        const Divider(thickness: 1),
      ],
    );
  }

  Widget privateProfile(Usuario user) {
    setState(() {});
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.lock),
        Text(
          "Este perfil é privado.",
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }

  Widget listarPendencias() {
    TextStyle _textStyle = const TextStyle(fontSize: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.user!.nome == "") Text("- Nome Completo", style: _textStyle),
        if (widget.user!.idade == "") Text("- Idade", style: _textStyle),
        if (isInvalidDate(widget.user!.dataNasc!) == true)
          Text("- Data de Nascimento", style: _textStyle),
        if (widget.user!.alturaMetro == "")
          Text("- Altura Metros", style: _textStyle),
        if (widget.user!.alturaCentimetro == "")
          Text("- Altura Centimetros", style: _textStyle),
        if (widget.user!.pesoQuilos == "")
          Text("- Peso Quilos", style: _textStyle),
        if (widget.user!.pesoGramas == "")
          Text("- Peso Gramas", style: _textStyle),
        if (widget.user!.listaEuSou!.isEmpty)
          Text("- Personalidade (Eu sou)", style: _textStyle),
      ],
    );
  }
}
