import 'package:flutter/material.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/visualizar_exemplo_widget.dart';

class Sugestao extends StatefulWidget {
  int? limiteSelecoes;
  List<String>? listaUser;
  Map<String, String> listaSugestoes;
  String? titulo;
  bool? isPublic;

  Sugestao({
    Key? key,
    required this.listaSugestoes,
    required this.limiteSelecoes,
    required this.titulo,
    required this.listaUser,
    this.isPublic,
  }) : super(key: key);

  @override
  State<Sugestao> createState() => _SugestaoState();
}

class _SugestaoState extends State<Sugestao> {
  List<String> _selectedItems = [];
  bool saved = false;
  bool checked = false;
  late TextEditingController _controller;

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        if (_selectedItems.length < widget.limiteSelecoes!) {
          _selectedItems.add(itemValue);
        } //controle de quantidade selecionada

        //print(_selectedItems);
      } else {
        _selectedItems.remove(itemValue);
        //print(_selectedItems);
      }
    });
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //mantendo os itens do usuario caso ele queira edita-los
    if (widget.listaUser != null) _selectedItems = widget.listaUser!;

    return WillPopScope(
      onWillPop: () async {
        if (!saved) {
          return false;
        }
        return true;
      },
      child: AlertDialog(
        title: Column(
          children: [
            Text(widget.titulo!),
            if ((_selectedItems.length < widget.limiteSelecoes!))
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${_selectedItems.length} / ${widget.limiteSelecoes}",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ))
            else
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "${_selectedItems.length} / ${widget.limiteSelecoes}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
            Wrap(
                children: _selectedItems
                    .map((item) => Chip(
                          label: Text(item),
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () {
                            setState(() {
                              _selectedItems.remove(item);
                              //print(_selectedItems);
                            });
                          },
                        ))
                    .toList()),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListBody(
                children: widget.listaSugestoes.keys
                    .map((item) => CheckboxListTile(
                          secondary: IconButton(
                            tooltip: "VISUALIZAR EXEMPLO",
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => VisualizarExemplo(
                                      nomeExemplo: item,
                                      image: widget.listaSugestoes[item]!));
                            },
                            icon: const Icon(Icons.help),
                          ),
                          activeColor: Colors.black,
                          title: Text(item),
                          value: _selectedItems.contains(item),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (isChecked) {
                            _itemChange(item, isChecked!);
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        actions: [
          if (widget.isPublic == true)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: const [
                  Icon(Icons.public),
                  Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Público")),
                ],
              ),
            ),
          if (_selectedItems.length < widget.limiteSelecoes!)
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text("OUTRO"),
              ),
              onSubmitted: (value) {
                if (_controller.text != "") {
                  setState(() {
                    _selectedItems.add(value.toString().toUpperCase());
                    _controller.text = "";
                    //print(_selectedItems);
                  });
                }
              },
            ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text(
                  "LIMPAR",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    widget.listaUser = [];
                  });
                },
              ),
              const Padding(padding: EdgeInsets.only(right: 20)),
              TextButton(
                child: const Text(
                  "CANCELAR",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () => Navigator.pop(context, _selectedItems),
              ),
              if (_selectedItems.length < widget.limiteSelecoes!)
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  child: const Text("FINALIZAR"),
                  onPressed: () => Navigator.pop(context, _selectedItems),
                )
              else
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Text("Finalizar"),
                  onPressed: () => Navigator.pop(context, _selectedItems),
                )
            ],
          ),
        ],
      ),
    );
  }
}
