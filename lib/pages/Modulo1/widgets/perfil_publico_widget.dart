import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/generate_user_text_widget.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/mostrar_informacoes_widget.dart';
import 'package:projeto_final_unb/utilities/invalid_date.dart';

class PerfilPublico extends StatelessWidget {
  final Usuario user;
  const PerfilPublico({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  user: user,
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
        ),
        MostrarInformacoes(user: user),
      ],
    );
  }

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

  Widget listarPendencias() {
    TextStyle _textStyle = const TextStyle(fontSize: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (user.nome == "") Text("- Nome Completo", style: _textStyle),
        if (user.idade == "") Text("- Idade", style: _textStyle),
        if (isInvalidDate(user.dataNasc!) == true)
          Text("- Data de Nascimento", style: _textStyle),
        if (user.alturaMetro == "") Text("- Altura Metros", style: _textStyle),
        if (user.alturaCentimetro == "")
          Text("- Altura Centimetros", style: _textStyle),
        if (user.pesoQuilos == "") Text("- Peso Quilos", style: _textStyle),
        if (user.pesoGramas == "") Text("- Peso Gramas", style: _textStyle),
        if (user.listaEuSou!.isEmpty)
          Text("- Personalidade (Eu sou)", style: _textStyle),
      ],
    );
  }
}
