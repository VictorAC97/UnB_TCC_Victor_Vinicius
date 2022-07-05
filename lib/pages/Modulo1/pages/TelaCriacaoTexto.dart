// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/bloco_sugestoes_widget.dart';
import '../../../utilities/monthsInYear.dart';
import '../../../utilities/invalid_date.dart';

class TelaCriacaoTexto extends StatefulWidget {
  Usuario? user;
  TelaCriacaoTexto({Key? key, this.user}) : super(key: key);

  @override
  State<TelaCriacaoTexto> createState() => _TelaCriacaoTextoState();
}

class _TelaCriacaoTextoState extends State<TelaCriacaoTexto> {
  late TextEditingController _controller;
  late TextEditingController _controllerIdade;
  late TextEditingController _controllerAlturaMetros;
  late TextEditingController _controllerAlturaCentimetros;
  late TextEditingController _controllerPesoQuilos;
  late TextEditingController _controllerPesoGramas;

  @override
  void initState() {
    _controller = TextEditingController();
    _controllerIdade = TextEditingController();
    _controllerAlturaMetros = TextEditingController();
    _controllerAlturaCentimetros = TextEditingController();
    _controllerPesoQuilos = TextEditingController();
    _controllerPesoGramas = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerIdade.dispose();
    _controllerAlturaMetros.dispose();
    _controllerAlturaCentimetros.dispose();
    _controllerPesoQuilos.dispose();
    _controllerPesoGramas.dispose();
    super.dispose();
  }

  Widget _divider() => const Divider(thickness: 1.0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "CONSTRUINDO O TEXTO BIBLIOGRÁFICO",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(
              thickness: 1.0,
            ),
            Text(
              "MEU NOME É ${widget.user!.nome}",
              style: const TextStyle(fontSize: 18),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.rotate_left_outlined),
                onPressed: () {
                  setState(() {
                    widget.user!.nome = "";
                    _controller.clear();
                  });
                },
              ),
            ),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text("NOME COMPLETO"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
              ),
              autovalidateMode: AutovalidateMode.always,
              validator: (value) {
                if (widget.user!.nome == "") {
                  return 'CAMPO OBRIGATÓRIO!';
                }
                return null;
              },
              onChanged: (newValue) {
                setState(() {
                  widget.user!.nome = newValue.toUpperCase();
                });
              },
            ),
            _divider(),
            if (widget.user!.idade != null)
              Text(
                "TENHO ${widget.user!.idade} ANOS",
                style: const TextStyle(fontSize: 18),
              )
            else
              const Text(
                "TENHO   ANOS",
                style: TextStyle(fontSize: 18),
              ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.rotate_left_outlined),
                onPressed: () {
                  setState(() {
                    widget.user!.idade = "";
                    _controllerIdade.clear();
                  });
                },
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tight(const Size(152, 96)),
              child: TextFormField(
                controller: _controllerIdade,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("IDADE"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (widget.user!.idade == "") {
                    return 'CAMPO OBRIGATÓRIO!';
                  }
                  return null;
                },
                onChanged: (newValue) {
                  setState(() {
                    widget.user!.idade = newValue;
                  });
                },
              ),
            ),
            _divider(),
            if (widget.user!.dataNasc != null)
              Text(
                "EU NASCI NO DIA ${widget.user!.dataNasc!.day} DO MÊS DE ${mesesDoAno[widget.user!.dataNasc!.month]} DO ANO DE ${widget.user!.dataNasc!.year}.",
                style: const TextStyle(fontSize: 18),
              ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.rotate_left_outlined),
                onPressed: () {
                  setState(() {
                    widget.user!.dataNasc = DateTime.now();
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    Text(
                      "DATA DE NASCIMENTO: ${widget.user!.dataNasc!.day}/${widget.user!.dataNasc!.month}/${widget.user!.dataNasc!.year}",
                      style: TextStyle(
                          fontSize: 18,
                          color: isInvalidDate(widget.user!.dataNasc!)
                              ? Colors.red
                              : Colors.black),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.calendar_today_outlined),
                      label: const Text("Adicionar"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () async {
                        widget.user!.dataNasc = await showDatePicker(
                            locale: const Locale('pt', 'BR'),
                            context: context,
                            initialEntryMode: DatePickerEntryMode.calendar,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now());
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            _divider(),
            if (widget.user!.alturaMetro != null &&
                widget.user!.alturaCentimetro != null)
              Text(
                  "MINHA ALTURA É ${widget.user!.alturaMetro} METRO(S) E ${widget.user!.alturaCentimetro} CENTÍMETROS",
                  style: const TextStyle(fontSize: 18))
            else
              const Text("MINHA ALTURA É  METRO(S) E  CENTÍMETROS",
                  style: TextStyle(fontSize: 18)),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.rotate_left_outlined),
                onPressed: () {
                  setState(() {
                    widget.user!.alturaMetro = "";
                    widget.user!.alturaCentimetro = "";
                    _controllerAlturaMetros.clear();
                    _controllerAlturaCentimetros.clear();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(96, 96)),
                  child: TextFormField(
                    controller: _controllerAlturaMetros,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text("METROS")),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (widget.user!.alturaMetro == "") {
                        return '*';
                      }
                      return null;
                    },
                    onChanged: (newValue) {
                      widget.user!.alturaMetro = newValue;
                      setState(() {});
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(128, 96)),
                  child: TextFormField(
                    controller: _controllerAlturaCentimetros,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(label: Text("CENTIMETROS")),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (widget.user!.alturaCentimetro == "") {
                        return '*';
                      }
                      return null;
                    },
                    onChanged: (newValue) {
                      widget.user!.alturaCentimetro = newValue;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            _divider(),
            if (widget.user!.pesoQuilos != null &&
                widget.user!.pesoGramas != null)
              Text(
                "TENHO ${widget.user!.pesoQuilos} QUILOS E ${widget.user!.pesoGramas} GRAMAS DE PESO",
                style: const TextStyle(fontSize: 18),
              )
            else
              const Text(
                "TENHO  QUILOS E  GRAMAS DE PESO ",
                style: TextStyle(fontSize: 18),
              ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.rotate_left_outlined),
                onPressed: () {
                  setState(() {
                    widget.user!.pesoQuilos = "";
                    widget.user!.pesoGramas = "";
                    _controllerPesoQuilos.clear();
                    _controllerPesoGramas.clear();
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(96, 96)),
                  child: TextFormField(
                    controller: _controllerPesoQuilos,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text("QUILOS")),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (widget.user!.pesoQuilos == "") {
                        return '*';
                      }
                      return null;
                    },
                    onChanged: (newValue) {
                      widget.user!.pesoQuilos = newValue;
                      setState(() {});
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tight(const Size(96, 96)),
                  child: TextFormField(
                    controller: _controllerPesoGramas,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text("GRAMAS")),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (widget.user!.pesoGramas == "") {
                        return '*';
                      }
                      return null;
                    },
                    onChanged: (newValue) {
                      widget.user!.pesoGramas = newValue;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            _divider(),
            BlocoSugestoes(
              user: widget.user,
              limiteSelecoes: 5,
            ),
          ],
        ),
      ),
    );
  }
}
