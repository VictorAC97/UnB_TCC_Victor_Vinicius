import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Endereco.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/widgets/DefinirPrivacidade.dart';

class InfoEndereco extends StatefulWidget {
  bool? isPublic;
  Endereco? enderecoUser;
  InfoEndereco({Key? key, this.isPublic, this.enderecoUser}) : super(key: key);

  @override
  State<InfoEndereco> createState() => _InfoEnderecoState();
}

late TextEditingController _controllerMoroEm;
late TextEditingController _controllerCidade;
late TextEditingController _controllerEstado;
late TextEditingController _controllerPais;
late Endereco _endereco;
bool saved = false;

class _InfoEnderecoState extends State<InfoEndereco> {
  @override
  void initState() {
    _controllerMoroEm = TextEditingController();
    _controllerCidade = TextEditingController();
    _controllerEstado = TextEditingController();
    _controllerPais = TextEditingController();
    _endereco = Endereco(moroEm: "", cidade: "", estado: "", pais: "");
    super.initState();
  }

  @override
  void dispose() {
    _controllerMoroEm.dispose();
    _controllerCidade.dispose();
    _controllerEstado.dispose();
    _controllerPais.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //mantendo os itens do usuario caso ele queira edita-los
    if (widget.enderecoUser != null) _endereco = widget.enderecoUser!;

    return WillPopScope(
      onWillPop: () async {
        if (!saved) {
          return false;
        }
        return true;
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.all(12),
        title: Text("MORO EM"),
        content: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  children: [
                    Chip(label: Text("Moro em: ${_endereco.moroEm}")),
                    Chip(label: Text("Cidade: ${_endereco.cidade}")),
                    Chip(label: Text("Estado: ${_endereco.estado}")),
                    Chip(label: Text("País: ${_endereco.pais}")),
                  ],
                ),
                TextField(
                  controller: _controllerMoroEm,
                  decoration: InputDecoration(label: Text("Moro em")),
                  onChanged: (value) {
                    setState(() {
                      _endereco.moroEm = value;
                    });
                  },
                ),
                TextField(
                  controller: _controllerCidade,
                  decoration: InputDecoration(label: Text("Cidade")),
                  onChanged: (value) {
                    setState(() {
                      _endereco.cidade = value;
                    });
                  },
                ),
                TextField(
                  controller: _controllerEstado,
                  decoration: InputDecoration(label: Text("Estado")),
                  onChanged: (value) {
                    setState(() {
                      _endereco.estado = value;
                    });
                  },
                ),
                TextField(
                  controller: _controllerPais,
                  decoration: InputDecoration(label: Text("Pais")),
                  onChanged: (value) {
                    setState(() {
                      _endereco.pais = value;
                    });
                  },
                ),
                if (widget.isPublic == true)
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Icon(Icons.public),
                        Text("Público"),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              "Limpar",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              setState(() {
                _endereco.moroEm = "";
                _endereco.cidade = "";
                _endereco.estado = "";
                _endereco.pais = "";
                _controllerMoroEm.clear();
                _controllerCidade.clear();
                _controllerEstado.clear();
                _controllerPais.clear();
              });
            },
          ),
          TextButton(
            child: Text(
              "Cancelar",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context, _endereco);
            },
          ),
          ElevatedButton(
            child: Text("Salvar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context, _endereco);
            },
          ),
        ],
      ),
    );
  }
}
