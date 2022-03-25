import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/widgets/Sugestao.dart';
import '../Sugestoes/Suggestions.dart';
import '../widgets/Anexo.dart';
import 'package:image/image.dart' as img;

class Modulo1 extends StatefulWidget {
  Usuario? user;
  Modulo1({Key? key, this.user}) : super(key: key);

  @override
  State<Modulo1> createState() => _Modulo1State();
}

class _Modulo1State extends State<Modulo1> {
  TextEditingController _controller = TextEditingController();
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

  //conversor de Xfile para File
  File convertToFile(XFile xFile) => File(xFile.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("MÓDULO 1 - Criação de perfil"),
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
                  altura: 200, largura: 200, picture: widget.user!.fotoPerfil),

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Divider(
                  thickness: 1.0,
                ),
                Text(
                  "EU SOU: ",
                  style: TextStyle(fontSize: 18),
                ),

                if (widget.user!.listaEuSou != null)
                  Wrap(
                    children: widget.user!.listaEuSou!
                        .map((item) => Chip(
                              label: Text(item),
                            ))
                        .toList(),
                  ),

                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Adicionar"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    onPressed: () async {
                      widget.user!.listaEuSou = await showDialog(
                        context: context,
                        builder: (context) => Sugestao(
                            user: widget.user,
                            listaSugestoes: sugestaoPersonalidade,
                            limiteSelecoes: 5,
                            titulo: "EU SOU:"),
                      );
                      setState(() {});
                    },
                  ),
                ),

                Divider(
                  thickness: 1.0,
                ),
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
              onPressed: () {},
              icon: Icon(Icons.close, color: Colors.red),
              iconSize: 35,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: Colors.green,
              ),
              iconSize: 35,
            ),
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
        onPressed: () {},
      ),
    );
  }
}
