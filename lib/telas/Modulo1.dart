import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/VisualizarPerfil.dart';
import 'package:projeto_final_unb/widgets/BlocoSugestoes.dart';
import 'package:projeto_final_unb/widgets/Sugestao.dart';
import '../utilities/Suggestions.dart';
import '../widgets/Anexo.dart';
import 'package:image/image.dart' as img;
import '../utilities/monthsInYear.dart';

class Modulo1 extends StatefulWidget {
  Usuario? user;
  Modulo1({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo1> createState() => _Modulo1State();
}

class _Modulo1State extends State<Modulo1> {
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
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controllerIdade.dispose();
    _controllerAlturaMetros.dispose();
    _controllerAlturaCentimetros.dispose();
    _controllerPesoQuilos.dispose();
    _controllerPesoGramas.dispose();
  }

  final picker = ImagePicker();
  XFile? imagem;

  Future getFileFromCamera() async {
    final file = await picker.pickImage(source: ImageSource.camera);

    if (file != null) {
      setState(() {
        imagem = file;
        //salvando a foto no objeto Usuario user
        widget.user!.fotoPerfil = convertToFile(imagem!);
      });
    }
  }

  Future getFileFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        imagem = file;
        //salvando a foto no objeto Usuario user
        widget.user!.fotoPerfil = convertToFile(imagem!);
      });
    }
  }

  Widget _divider() => Divider(thickness: 1.0);

  //conversor de Xfile para File
  File convertToFile(XFile xFile) => File(xFile.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("MÓDULO 1 - Criação de Perfil"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          alignment: Alignment.center,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            //Fotografia

            if (widget.user!.fotoPerfil != null)
              Anexo(
                altura: 200,
                largura: 200,
                picture: widget.user!.fotoPerfil,
              ),

            ElevatedButton.icon(
              icon: Icon(Icons.photo_camera),
              label: Padding(
                  padding: EdgeInsets.all(12), child: Text("Tirar uma foto")),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                elevation: 0,
                textStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () => getFileFromCamera(),
            ),

            Padding(
              padding: EdgeInsets.all(12),
              child: Text("ou"),
            ),

            OutlinedButton.icon(
              icon: Icon(Icons.attach_file),
              label: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("Carregar uma foto")),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                //elevation: 0,
              ),
              onPressed: () => getFileFromGallery(),
            ), //Construção do texto bibliografico
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text("CONSTRUINDO O TEXTO BIBLIOGRÁFICO")),
                Divider(
                  thickness: 1.0,
                ),
                //Contatenacao de strings entre FIXA e input sugerido ou do usuario
                //input sera feito em uma widget dropdown multiselect com checkboxes
                Text(
                  "MEU NOME É: ${widget.user!.nome}",
                  style: TextStyle(fontSize: 18),
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(label: Text("Informe seu nome")),
                  onSubmitted: (newValue) {
                    setState(() {
                      widget.user!.nome = newValue.toUpperCase();
                      _controller.text = "";
                    });
                  },
                ),
                _divider(),
                if (widget.user!.idade != null)
                  Text(
                    "TENHO ${widget.user!.idade} ANOS.",
                    style: TextStyle(fontSize: 18),
                  )
                else
                  Text(
                    "TENHO   ANOS.",
                    style: TextStyle(fontSize: 18),
                  ),
                ConstrainedBox(
                  constraints: BoxConstraints.tight(Size(110, 50)),
                  child: TextField(
                    controller: _controllerIdade,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(label: Text("Informe sua idade")),
                    onSubmitted: (newValue) {
                      setState(() {
                        widget.user!.idade = newValue;
                        _controllerIdade.clear();
                      });
                    },
                  ),
                ),
                _divider(),
                if (widget.user!.dataNasc != null)
                  Text(
                    "EU NASCI DO DIA ${widget.user!.dataNasc!.day} DO MÊS DE ${mesesDoAno[widget.user!.dataNasc!.month]} DO ANO DE ${widget.user!.dataNasc!.year}.",
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
                    style: TextStyle(fontSize: 18),
                  )
                else
                  Text(
                    "MINHA ALTURA É  METRO(S) E  CENTÍMETROS",
                    style: TextStyle(fontSize: 18),
                  ),
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
                          widget.user!.alturaMetro = int.parse(newValue);
                          setState(() {});
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(70, 60)),
                      child: TextField(
                        controller: _controllerAlturaCentimetros,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(label: Text("centimetros")),
                        onChanged: (newValue) {
                          widget.user!.alturaCentimetro = int.parse(newValue);
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
                          widget.user!.pesoQuilos = int.parse(newValue);
                          setState(() {});
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(50, 60)),
                      child: TextField(
                        controller: _controllerPesoGramas,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(label: Text("gramas")),
                        onChanged: (newValue) {
                          widget.user!.pesoGramas = int.parse(newValue);
                          setState(() {
                            //_controllerAlturaCentimetros.clear();
                            //_controllerAlturaMetros.clear();
                          });
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
                _divider(),

                _divider(),
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              iconSize: 35,
              onPressed: () {
                //Navigator.pop(context);
              },
            ),
            IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                iconSize: 35,
                onPressed: () {}),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: "Visualizar o perfil",
        backgroundColor: Colors.black,
        child: Icon(
          Icons.remove_red_eye_outlined,
          size: 40,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VisualizarPerfil(user: widget.user)));
        },
      ),
    );
  }
}
