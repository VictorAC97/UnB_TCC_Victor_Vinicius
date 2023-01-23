import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';

class MostrarInformacoes extends StatelessWidget {
  final Usuario user;
  const MostrarInformacoes({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 1),
        Text("MEU TRABALHO", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (user.dadosEmprego!.empresa != "")
          Text("${user.dadosEmprego!.empresa}".toUpperCase()),
        if (user.dadosEmprego!.cargo != "")
          Text("${user.dadosEmprego!.cargo}".toUpperCase()),
        if (user.dadosEmprego!.cidade != "")
          Text("${user.dadosEmprego!.cidade}".toUpperCase()),
        const Divider(thickness: 1),
        Text("ESCOLARIDADE", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (user.escolaridade!.isNotEmpty) Text(user.escolaridade!),
        const Divider(thickness: 1),
        Text("MINHAS ATIVIDADES", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (user.listaAtividades!.isNotEmpty)
          Text(user.listaAtividades!.join(", ")),
        const Divider(thickness: 1),
/*        
        Text("LOCALIDADE", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (user.endereco!.moroEm!.isNotEmpty)
          Text("MORO EM ${user.endereco!.moroEm!}."),
        const Padding(padding: EdgeInsets.all(4)),
        if (user.endereco!.pais!.isNotEmpty &&
            user.endereco!.cidade!.isNotEmpty &&
            user.endereco!.estado!.isNotEmpty)
          Column(children: [
            Text("SOU DA CIDADE: ${user.endereco!.cidade}"),
            Text("ESTADO: ${user.endereco!.estado}"),
            Text("PAÍS: ${user.endereco!.pais}"),
          ]),
        const Divider(thickness: 1),
*/
        Text("STATUS DE RELACIONAMENTO", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (user.relacionamento!.isNotEmpty) Text("${user.relacionamento}"),
        //const Divider(thickness: 1),
        //Text("TELEFONE", style: _estiloTitulo()),
        //const Padding(padding: EdgeInsets.all(2)),
        //if (user.telefone != "") Text("${user.telefone}"),
        const Divider(thickness: 1),
        Text("MEUS HOBBIES", style: _estiloTitulo()),
        const Padding(padding: EdgeInsets.all(2)),
        if (user.listaHobbies!.isNotEmpty) Text(user.listaHobbies!.join(", ")),
        const Divider(thickness: 1),
      ],
    );
  }
}

TextStyle? _estiloTitulo() => const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );
