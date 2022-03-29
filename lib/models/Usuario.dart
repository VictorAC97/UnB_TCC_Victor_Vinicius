import 'package:flutter/material.dart';
import 'dart:io';

class Usuario {
  String? nome;
  DateTime? dataNasc; //DateTime? _dateTime = DateTime(1997, 12, 28);
  //criar um metodo de preenchimento automatico a partir de dataAtual - dataNasc
  String? idade;
  File? fotoPerfil;
  int? alturaMetro;
  int? alturaCentimetro;
  int? pesoQuilos;
  int? pesoGramas;
  List<String>? listaCorOlhos;
  List<String>? listaEuSou;
  List<String>? listaMinhaComidaPreferida;
  List<String>? listaMinhaCorPele;
  List<String>? listaGostoDe;
  List<String>? listaNaoGostoDe;
  List<String>? listaCorPreferida;
  List<String>? listaSigno;
  List<String>? listaLocalTrabalho;
  List<String>? listaLocalEnsino;

  Usuario({
    this.nome,
    this.dataNasc,
    this.idade,
    this.alturaMetro,
    this.alturaCentimetro,
    this.pesoQuilos,
    this.pesoGramas,
    this.fotoPerfil,
    this.listaCorOlhos,
    this.listaEuSou,
    this.listaMinhaComidaPreferida,
    this.listaCorPreferida,
    this.listaMinhaCorPele,
    this.listaGostoDe,
    this.listaNaoGostoDe,
    this.listaSigno,
    this.listaLocalEnsino,
    this.listaLocalTrabalho,
  });
}
