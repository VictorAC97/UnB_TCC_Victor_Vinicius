import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Emprego.dart';
import 'package:projeto_final_unb/models/Endereco.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/utilities/Suggestions.dart';
import 'package:projeto_final_unb/widgets/DefinirPrivacidade.dart';
import 'package:projeto_final_unb/widgets/InfoEndereco.dart';
import 'package:projeto_final_unb/widgets/InfoEstudo.dart';
import 'package:projeto_final_unb/widgets/InfoTrabalho.dart';
import 'package:projeto_final_unb/widgets/Sugestao.dart';
import '../widgets/InfoRelacionamento.dart';

class TelaDadosPublicosPrivados extends StatefulWidget {
  Usuario? user;
  TelaDadosPublicosPrivados({Key? key, this.user}) : super(key: key);

  @override
  State<TelaDadosPublicosPrivados> createState() =>
      _TelaDadosPublicosPrivadosState();
}

class _TelaDadosPublicosPrivadosState extends State<TelaDadosPublicosPrivados> {
  Emprego _emprego = Emprego(cargo: "", cidade: "", empresa: "");
  Endereco _endereco = Endereco(moroEm: "", cidade: "", estado: "", pais: "");
  late TextEditingController _controllerTel;

  Widget _divider() => Divider(thickness: 1.0);

  @override
  void initState() {
    _controllerTel = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerTel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.user!.dadosEmprego != null)
      _emprego = widget.user!.dadosEmprego!;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "DADOS INFORMATIVOS PÚBLICOS OU PRIVADOS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _divider(),
            Text(
              "DEFINIÇÃO DE PRIVACIDADE",
              style: TextStyle(fontSize: 18),
            ),
            if (widget.user!.isPublic == true)
              Chip(
                label: Text("PÚBLICO"),
              ),
            if (widget.user!.isPublic == false)
              Chip(
                label: Text("PRIVADO"),
              ),
            ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () async {
                widget.user!.isPublic = await showDialog(
                    context: context,
                    builder: (context) =>
                        DefinirPrivacidade(user: widget.user));
                setState(() {});
              },
              icon: Icon(Icons.privacy_tip_outlined),
              label: Text("Definir Privacidade"),
            ),
            _divider(),
            Text(
              "MEU TRABALHO",
              style: TextStyle(fontSize: 18),
            ),
            Wrap(
              children: [
                if (_emprego.empresa != "")
                  Chip(label: Text("Empresa: ${_emprego.empresa}")),
                if (_emprego.cargo != "")
                  Chip(label: Text("Cargo: ${_emprego.cargo}")),
                if (_emprego.cidade != "")
                  Chip(label: Text("Cidade: ${_emprego.cidade}")),
              ],
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Adicionar"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () async {
                _emprego = await showDialog(
                  context: context,
                  builder: (context) => InfoTrabalho(
                    isPublic: widget.user!.isPublic,
                    empregoUser: widget.user!.dadosEmprego,
                  ),
                );
                setState(() {
                  widget.user!.dadosEmprego = _emprego;
                });
              },
            ),
            _divider(),
            Text(
              "ONDE ESTUDO",
              style: TextStyle(fontSize: 18),
            ),
            if (widget.user!.listaEscolaridade != null)
              Wrap(
                  children: widget.user!.listaEscolaridade!
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList()),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Adicionar"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () async {
                widget.user!.listaEscolaridade = await showDialog(
                  context: context,
                  builder: (context) => InfoEstudo(
                    listaUser: widget.user!.listaEscolaridade,
                    isPublic: widget.user!.isPublic,
                  ),
                );
                setState(() {});
              },
            ),
            _divider(),
            Text(
              "MORO EM",
              style: TextStyle(fontSize: 18),
            ),
            if (_endereco.moroEm != "")
              Chip(label: Text("${_endereco.moroEm}")),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Adicionar"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () async {
                _endereco = await showDialog(
                  context: context,
                  builder: (context) => InfoEndereco(
                    isPublic: widget.user!.isPublic,
                    enderecoUser: widget.user!.endereco,
                  ),
                );
                setState(() {
                  widget.user!.endereco = _endereco;
                });
              },
            ),
            _divider(),
            Text(
              "SOU DA CIDADE DE \n ESTADO DE \n PAÍS",
              style: TextStyle(fontSize: 18),
            ),
            Wrap(
              children: [
                Chip(label: Text("Cidade: ${_endereco.cidade}")),
                Chip(label: Text("Estado: ${_endereco.estado}")),
                Chip(label: Text("País: ${_endereco.pais}")),
              ],
            ),
            _divider(),
            Text(
              "STATUS DE RELACIONAMENTO",
              style: TextStyle(fontSize: 18),
            ),
            if (widget.user!.relacionamento != null &&
                widget.user!.relacionamento != "")
              Chip(label: Text(widget.user!.relacionamento.toString())),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Adicionar"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () async {
                widget.user!.relacionamento = await showDialog(
                  context: context,
                  builder: (context) => InfoRelacionamento(
                    relacionamentoUser: widget.user!.relacionamento,
                    isPublic: widget.user!.isPublic,
                  ),
                );
                setState(() {});
              },
            ),
            _divider(),
            if (widget.user!.telefone != null)
              Chip(label: Text(widget.user!.telefone!)),
            Text(
              "TELEFONE",
              style: TextStyle(fontSize: 18),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200, 60)),
              child: TextField(
                controller: _controllerTel,
                decoration: InputDecoration(label: Text("Telefone")),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    widget.user!.telefone = value;
                  });
                },
              ),
            ),
            _divider(),
            Text(
              "HOBBIES",
              style: TextStyle(fontSize: 18),
            ),
            if (widget.user!.listaHobbies != null)
              Wrap(
                children: widget.user!.listaHobbies!
                    .map((item) => Chip(
                          label: Text(item),
                        ))
                    .toList(),
              ),
            ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text("Adicionar"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () async {
                widget.user!.listaHobbies = await showDialog(
                  context: context,
                  builder: (context) => Sugestao(
                      listaUser: widget.user!.listaHobbies,
                      listaSugestoes: sugestaoHobbies,
                      limiteSelecoes: 5,
                      isPublic: widget.user!.isPublic,
                      titulo: "MEUS HOBBIES SÃO: "),
                );
                setState(() {});
              },
            ),
            _divider(),
          ],
        ),
      ),
    );
  }
}
