import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Emprego.dart';

class InfoTrabalho extends StatefulWidget {
  bool? isPublic;
  Emprego? empregoUser;
  InfoTrabalho({Key? key, this.isPublic, this.empregoUser}) : super(key: key);

  @override
  State<InfoTrabalho> createState() => _InfoTrabalhoState();
}

late TextEditingController _controllerEmpresa;
late TextEditingController _controllerCargo;
late TextEditingController _controllerCidade;
late Emprego _emprego;
bool saved = false;

class _InfoTrabalhoState extends State<InfoTrabalho> {
  @override
  void initState() {
    _controllerEmpresa = TextEditingController();
    _controllerCargo = TextEditingController();
    _controllerCidade = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerEmpresa.dispose();
    _controllerCargo.dispose();
    _controllerCidade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.empregoUser != null
        ? _emprego = widget.empregoUser!
        : _emprego = Emprego(cargo: "", empresa: "", cidade: "");

    return WillPopScope(
      onWillPop: () async {
        if (!saved) {
          return false;
        }
        return true;
      },
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(12),
        title: const Text("MEU TRABALHO"),
        content: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  children: [
                    Chip(label: Text("EMPRESA: ${_emprego.empresa}")),
                    Chip(label: Text("CARGO: ${_emprego.cargo}")),
                    Chip(label: Text("CIDADE: ${_emprego.cidade}")),
                  ],
                ),
                TextField(
                  controller: _controllerEmpresa,
                  decoration: const InputDecoration(label: Text("EMPRESA")),
                  onChanged: (value) {
                    setState(() {
                      _emprego.empresa = value.toUpperCase();
                    });
                  },
                ),
                TextField(
                  controller: _controllerCargo,
                  decoration: const InputDecoration(label: Text("CARGO")),
                  onChanged: (value) {
                    setState(() {
                      _emprego.cargo = value.toUpperCase();
                    });
                  },
                ),
                TextField(
                  controller: _controllerCidade,
                  decoration: const InputDecoration(label: Text("CIDADE")),
                  onChanged: (value) {
                    setState(() {
                      _emprego.cidade = value.toUpperCase();
                    });
                  },
                ),
                if (widget.isPublic == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      children: const [
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
            child: const Text(
              "Limpar",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              setState(() {
                _emprego.empresa = "";
                _emprego.cargo = "";
                _emprego.cidade = "";
                _controllerEmpresa.clear();
                _controllerCargo.clear();
                _controllerCidade.clear();
              });
            },
          ),
          TextButton(
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.pop(context, _emprego);
            },
          ),
          ElevatedButton(
            child: const Text("Salvar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context, _emprego);
            },
          ),
        ],
      ),
    );
  }
}
