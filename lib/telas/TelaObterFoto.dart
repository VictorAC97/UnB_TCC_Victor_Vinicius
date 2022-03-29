import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_final_unb/widgets/Anexo.dart';
import '../models/Usuario.dart';

class TelaObterFoto extends StatefulWidget {
  Usuario? user;

  TelaObterFoto({Key? key, this.user}) : super(key: key);

  @override
  State<TelaObterFoto> createState() => _TelaObterFotoState();
}

File convertToFile(XFile xFile) => File(xFile.path);

class _TelaObterFotoState extends State<TelaObterFoto> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.user!.fotoPerfil != null)
              Column(
                children: [
                  Anexo(
                    altura: 300,
                    largura: 300,
                    picture: widget.user!.fotoPerfil,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.public),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Sua foto do perfil é pública.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
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
              ),
              onPressed: () => getFileFromGallery(),
            ),
          ],
        ),
      ),
    );
  }
}
