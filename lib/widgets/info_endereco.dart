import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Endereco.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/widgets/definicao_privacidade.dart';

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
    widget.enderecoUser != null
        ? _endereco = widget.enderecoUser!
        : _endereco = Endereco(moroEm: "", cidade: "", estado: "", pais: "");

    return WillPopScope(
      onWillPop: () async {
        if (!saved) {
          return false;
        }
        return true;
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.all(10),
        title: Text("MORO EM"),
        content: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  children: [
                    Chip(label: Text("MORO EM: ${_endereco.moroEm}")),
                    Chip(label: Text("CIDADE: ${_endereco.cidade}")),
                    Chip(label: Text("ESTADO: ${_endereco.estado}")),
                    Chip(label: Text("PAÍS: ${_endereco.pais}")),
                  ],
                ),
                TextField(
                  controller: _controllerMoroEm,
                  decoration:
                      InputDecoration(label: Text("MORO ATUALMENTE EM")),
                  onChanged: (value) {
                    setState(() {
                      _endereco.moroEm = value.toUpperCase();
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("SOU NATURAL DE")),
                ),
                TextField(
                  controller: _controllerCidade,
                  decoration: InputDecoration(label: Text("CIDADE")),
                  onChanged: (value) {
                    setState(() {
                      _endereco.cidade = value.toUpperCase();
                    });
                  },
                ),
                TextField(
                  controller: _controllerEstado,
                  decoration: InputDecoration(label: Text("ESTADO")),
                  onChanged: (value) {
                    setState(() {
                      _endereco.estado = value.toUpperCase();
                    });
                  },
                ),
                TextField(
                  controller: _controllerPais,
                  decoration: InputDecoration(label: Text("PAÍS")),
                  onChanged: (value) {
                    setState(() {
                      _endereco.pais = value.toUpperCase();
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

_fillTextFields() {
  _controllerMoroEm.text = _endereco.moroEm!;
  _controllerCidade.text = _endereco.cidade!;
  _controllerEstado.text = _endereco.estado!;
  _controllerPais.text = _endereco.pais!;
}
