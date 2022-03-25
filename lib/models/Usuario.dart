import 'package:flutter/material.dart';
import 'dart:io';

class Usuario {
  String? nome;
  DateTime? dataNasc; //DateTime? _dateTime = DateTime(1997, 12, 28);
  //criar um metodo de preenchimento automatico a partir de dataAtual - dataNasc
  int? idade;
  File? fotoPerfil;
  String? corOlho;
  List<String>? listaEuSou;

  Usuario(
      {this.nome,
      this.dataNasc,
      this.idade,
      this.fotoPerfil,
      this.corOlho,
      this.listaEuSou});
}
