import 'package:flutter/material.dart';
import 'dart:io';

class Anexo extends StatelessWidget {
  File? picture;
  double? largura;
  double? altura;
  Anexo({Key? key, this.largura, this.altura, this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Center(
        child: SizedBox(
          width: largura,
          height: altura,
          child: ClipOval(
            //borderRadius: BorderRadius.circular(12),
            child: Image.file(
              picture!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
