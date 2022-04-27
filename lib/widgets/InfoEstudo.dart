import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import '../utilities/Suggestions.dart';

class InfoEstudo extends StatefulWidget {
  String? escolaridadeUser;
  List<String>? listaUser;
  bool? isPublic;

  InfoEstudo({
    Key? key,
    required this.listaUser,
    this.isPublic,
    this.escolaridadeUser,
  }) : super(key: key);

  @override
  State<InfoEstudo> createState() => _InfoEstudoState();
}

class _InfoEstudoState extends State<InfoEstudo> {
  List<String> _selectedItems = [];
  bool saved = false;
  bool checked = false;
  bool isSelected = false;
  late TextEditingController _controller;
  var listaSugestoes = sugestaoAtividades;
  var listaEscolaridade = sugestaoEscolaridade;

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
        print(_selectedItems);
      } else {
        _selectedItems.remove(itemValue);
        print(_selectedItems);
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
        contentPadding: EdgeInsets.all(0),
        title: Column(
          children: [
            Text("ONDE ESTUDO"),
            if (_selectedItems != null)
              Wrap(
                  children: _selectedItems
                      .map((item) => Chip(
                            label: Text(item),
                            deleteIcon: Icon(Icons.close),
                            onDeleted: () {
                              setState(() {
                                _selectedItems.remove(item);
                                print(_selectedItems);
                              });
                            },
                          ))
                      .toList()),
          ],
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: listaEscolaridade
                .map((e) => CheckboxListTile(
                    activeColor: Colors.black,
                    title: Text(e),
                    value: _selectedItems.contains(e),
                    onChanged: (isChecked) {
                      if (_selectedItems.contains(isChecked) == false) {
                        setState(() {
                          _itemChange(e, isChecked!);
                          print(isChecked);
                        });
                      }
                    }))
                .toList(),
          ),
        ),
        actions: [
          if (widget.isPublic == true)
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Icon(Icons.public),
                  Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text("Público")),
                ],
              ),
            ),
          //if (_selectedItems.length < 2)
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              label: Text("Outro"),
            ),
            onSubmitted: (value) {
              if (_controller.text != "")
                setState(() {
                  _selectedItems.add(value.toString().toUpperCase());
                  _controller.text = "";
                  print(_selectedItems);
                });
            },
          ),
          //Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(
                  "Limpar",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    widget.listaUser = [];
                  });
                },
              ),
              Padding(padding: EdgeInsets.only(right: 20)),
              TextButton(
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () => Navigator.pop(context, _selectedItems),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: Text("Finalizar"),
                onPressed: () => Navigator.pop(context, _selectedItems),
              )
            ],
          ),
        ],
      ),
    );
  }
}
