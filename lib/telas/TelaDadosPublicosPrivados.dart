import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Emprego.dart';
import 'package:projeto_final_unb/models/Endereco.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/utilities/Suggestions.dart';
import 'package:projeto_final_unb/widgets/definicao_privacidade.dart';
import 'package:projeto_final_unb/widgets/info_endereco.dart';
import 'package:projeto_final_unb/widgets/info_estudo.dart';
import 'package:projeto_final_unb/widgets/info_trabalho.dart';
import 'package:projeto_final_unb/widgets/Sugestao.dart';
import '../widgets/info_relacionamento.dart';

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

  Widget _divider() => const Divider(thickness: 1.0);

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
    if (widget.user!.dadosEmprego != null) {
      _emprego = widget.user!.dadosEmprego!;
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "DADOS INFORMATIVOS PÚBLICOS OU PRIVADOS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _divider(),
            const Text(
              "DEFINIÇÃO DE PRIVACIDADE",
              style: TextStyle(fontSize: 18),
            ),
            if (widget.user!.isPublic == true)
              const Chip(
                label: Text("PÚBLICO"),
              ),
            if (widget.user!.isPublic == false)
              const Chip(
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
              icon: const Icon(Icons.privacy_tip_outlined),
              label: const Text("Definir Privacidade"),
            ),
            _divider(),
            const Text(
              "MEU TRABALHO",
              style: TextStyle(fontSize: 18),
            ),
            Wrap(
              children: [
                if (_emprego.empresa != "")
                  Chip(label: Text("EMPRESA: ${_emprego.empresa}")),
                if (_emprego.cargo != "")
                  Chip(label: Text("CARGO: ${_emprego.cargo}")),
                if (_emprego.cidade != "")
                  Chip(label: Text("CIDADE: ${_emprego.cidade}")),
              ],
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Adicionar"),
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
            const Text(
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
              icon: const Icon(Icons.add),
              label: const Text("Adicionar"),
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
            const Text(
              "MORO EM",
              style: TextStyle(fontSize: 18),
            ),
            if (_endereco.moroEm != "")
              Chip(label: Text("${_endereco.moroEm}")),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Adicionar"),
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
            const Text(
              "SOU DA CIDADE DE \n ESTADO DE \n PAÍS",
              style: TextStyle(fontSize: 18),
            ),
            Wrap(
              children: [
                Chip(label: Text("CIDADE: ${_endereco.cidade}")),
                Chip(label: Text("ESTADO: ${_endereco.estado}")),
                Chip(label: Text("PAÍS: ${_endereco.pais}")),
              ],
            ),
            _divider(),
            const Text(
              "STATUS DE RELACIONAMENTO",
              style: TextStyle(fontSize: 18),
            ),
            if (widget.user!.relacionamento != null &&
                widget.user!.relacionamento != "")
              Chip(label: Text(widget.user!.relacionamento.toString())),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Adicionar"),
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
            if (widget.user!.telefone != "")
              Chip(label: Text(widget.user!.telefone!)),
            const Text(
              "TELEFONE",
              style: TextStyle(fontSize: 18),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(200, 60)),
              child: TextField(
                controller: _controllerTel,
                decoration: const InputDecoration(label: Text("Telefone")),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    widget.user!.telefone = value;
                  });
                },
              ),
            ),
            _divider(),
            const Text(
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
              icon: const Icon(Icons.add),
              label: const Text("Adicionar"),
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
