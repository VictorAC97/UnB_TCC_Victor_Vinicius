import 'package:flutter/material.dart';
import '../../../utilities/suggestionStrings.dart';

class InfoRelacionamento extends StatefulWidget {
  String? relacionamentoUser;
  bool? isPublic;

  InfoRelacionamento({
    Key? key,
    this.isPublic,
    this.relacionamentoUser,
  }) : super(key: key);

  @override
  State<InfoRelacionamento> createState() => _InfoRelacionamentoState();
}

class _InfoRelacionamentoState extends State<InfoRelacionamento> {
  bool saved = false;
  bool checked = false;
  bool isSelected = false;
  late TextEditingController _controller;
  var listaSugestoes = sugestaoRelacionamento;
  String? _relacionamento;

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
    if (widget.relacionamentoUser != "") {
      _relacionamento = widget.relacionamentoUser;
    }

    return WillPopScope(
      onWillPop: () async {
        if (!saved) {
          return false;
        }
        return true;
      },
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        title: const Text("STATUS DE RELACIONAMENTO"),
        content: SingleChildScrollView(
          child: ListBody(
            children: listaSugestoes
                .map((e) => CheckboxListTile(
                    activeColor: Colors.black,
                    title: Text(e),
                    value: widget.relacionamentoUser == e,
                    onChanged: (isChecked) {
                      setState(() {
                        widget.relacionamentoUser = e;
                      });
                    }))
                .toList(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text(
                  "Limpar",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  setState(() {
                    widget.relacionamentoUser = "";
                    _relacionamento = "";
                  });
                },
              ),
              const Padding(padding: EdgeInsets.only(right: 20)),
              TextButton(
                child: const Text(
                  "Cancelar",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text("Finalizar"),
                onPressed: () => Navigator.pop(context, _relacionamento),
              )
            ],
          ),
        ],
      ),
    );
  }
}
