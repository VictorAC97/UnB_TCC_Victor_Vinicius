import 'dart:io';

import 'package:projeto_final_unb/models/Emprego.dart';
import 'package:projeto_final_unb/models/Endereco.dart';

class Usuario {
  String? nome;
  DateTime? dataNasc; //DateTime? _dateTime = DateTime(1997, 12, 28);
  //criar um metodo de preenchimento automatico a partir de dataAtual - dataNasc
  String? idade;
  File? fotoPerfil;
  String? alturaMetro;
  String? alturaCentimetro;
  String? pesoQuilos;
  String? pesoGramas;
  List<String>? listaCorOlhos;
  List<String>? listaEuSou;
  List<String>? listaMinhaComidaPreferida;
  List<String>? listaMinhaCorPele;
  List<String>? listaGostoDe;
  List<String>? listaNaoGostoDe;
  List<String>? listaCorPreferida;
  List<String>? listaSigno;
  List<String>? listaAtividades;
  List<String>? listaHobbies;
  List<String>? listaEscolaridade;
  String? relacionamento;
  String? telefone;
  //String? textoBiografico;
  Endereco? endereco;
  Emprego? dadosEmprego;
  bool? isPublic;

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
    this.listaEscolaridade,
    this.relacionamento,
    this.listaHobbies,
    //this.textoBiografico,
    this.isPublic,
    this.telefone,
    this.endereco,
    this.dadosEmprego,
  });
}
