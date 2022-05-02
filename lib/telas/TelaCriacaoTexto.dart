import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/TelaObterFoto.dart';
import 'package:projeto_final_unb/telas/VisualizarPerfil.dart';
import 'package:projeto_final_unb/widgets/BlocoSugestoes.dart';
import '../widgets/Anexo.dart';
import '../utilities/monthsInYear.dart';

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

  Widget _divider() => Divider(thickness: 1.0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "CONSTRUINDO O TEXTO BIBLIOGRÁFICO",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 1.0,
            ),
            Text(
              "MEU NOME É ${widget.user!.nome}",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(label: Text("Informe seu nome")),
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
                style: TextStyle(fontSize: 18),
              )
            else
              Text(
                "TENHO   ANOS",
                style: TextStyle(fontSize: 18),
              ),
            ConstrainedBox(
              constraints: BoxConstraints.tight(Size(110, 50)),
              child: TextField(
                controller: _controllerIdade,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text("Informe sua idade")),
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
                style: TextStyle(fontSize: 18),
              ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    if (widget.user!.dataNasc == null)
                      Text(
                        "DATA DE NASCIMENTO: ",
                        style: TextStyle(fontSize: 18),
                      )
                    else
                      Text(
                        "DATA DE NASCIMENTO: ${widget.user!.dataNasc!.day}/${widget.user!.dataNasc!.month}/${widget.user!.dataNasc!.year}",
                        style: TextStyle(fontSize: 15),
                      ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.calendar_today_outlined),
                      label: Text("Adicionar"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () async {
                        widget.user!.dataNasc = await showDatePicker(
                            locale: Locale('pt', 'BR'),
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
                  style: TextStyle(fontSize: 18))
            else
              Text("MINHA ALTURA É  METRO(S) E  CENTÍMETROS",
                  style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(70, 60)),
                  child: TextField(
                    controller: _controllerAlturaMetros,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: Text("metros")),
                    onChanged: (newValue) {
                      widget.user!.alturaMetro = newValue;
                      setState(() {});
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(90, 60)),
                  child: TextField(
                    controller: _controllerAlturaCentimetros,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: Text("centimetros")),
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
                style: TextStyle(fontSize: 18),
              )
            else
              Text(
                "TENHO  QUILOS E  GRAMAS DE PESO ",
                style: TextStyle(fontSize: 18),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(60, 60)),
                  child: TextField(
                    controller: _controllerPesoQuilos,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: Text("quilos")),
                    onChanged: (newValue) {
                      widget.user!.pesoQuilos = newValue;
                      setState(() {});
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(60, 60)),
                  child: TextField(
                    controller: _controllerPesoGramas,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: Text("gramas")),
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
