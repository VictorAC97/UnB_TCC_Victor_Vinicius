import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';

class Sugestao extends StatefulWidget {
  int? limiteSelecoes;
  Usuario? user;
  List<String>? listaSugestoes;
  String? titulo;

  Sugestao(
      {Key? key,
      required this.user,
      required this.listaSugestoes,
      required this.limiteSelecoes,
      required this.titulo})
      : super(key: key);

  @override
  State<Sugestao> createState() => _SugestaoState();
}

class _SugestaoState extends State<Sugestao> {
  List<String> _selectedItems = [];
  bool? checked = false;
  TextEditingController _controller = TextEditingController();

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        if (_selectedItems.length < widget.limiteSelecoes!)
          _selectedItems.add(itemValue);
        print(_selectedItems);
      } else {
        _selectedItems.remove(itemValue);
        print(_selectedItems);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titulo!),
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("${_selectedItems.length} / ${widget.limiteSelecoes}"),
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
              ListBody(
                children: widget.listaSugestoes!
                    .map((item) => CheckboxListTile(
                          title: Text(item),
                          value: _selectedItems.contains(item),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (isChecked) {
                            _itemChange(item, isChecked!);
                          },
                        ))
                    .toList(),
              ),
              if (_selectedItems.length < widget.limiteSelecoes!)
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    label: Text("Outro"),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      _selectedItems.add(value.toString().toUpperCase());
                      _controller.text = "";
                      print(_selectedItems);
                    });
                  },
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          child: Text("Finalizar"),
          onPressed: () => Navigator.pop(context, _selectedItems),
        ),
      ],
    );
  }
}
