import 'package:flutter/material.dart';
import 'package:projeto_final_unb/utilities/Suggestions.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/widgets/Sugestao.dart';

class BlocoSugestoes extends StatefulWidget {
  late Usuario? user;
  int? limiteSelecoes;

  BlocoSugestoes({
    Key? key,
    required this.user,
    required this.limiteSelecoes,
  }) : super(key: key);

  @override
  State<BlocoSugestoes> createState() => _BlocoSugestoesState();
}

class _BlocoSugestoesState extends State<BlocoSugestoes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "EU SOU: ",
          style: TextStyle(
              fontSize: 18,
              color: widget.user!.listaEuSou!.isEmpty == true
                  ? Colors.red
                  : Colors.black),
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
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              widget.user!.listaEuSou = await showDialog(
                context: context,
                builder: (context) => Sugestao(
                    listaUser: widget.user!.listaEuSou,
                    listaSugestoes: sugestaoPersonalidade,
                    limiteSelecoes: widget.limiteSelecoes,
                    titulo: "EU SOU: "),
              );
              setState(() {});
            },
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text(
          "A COR DA MINHA PELE É: ",
          style: TextStyle(fontSize: 18),
        ),
        if (widget.user!.listaMinhaCorPele != null)
          Wrap(
            children: widget.user!.listaMinhaCorPele!
                .map((item) => Chip(
                      label: Text(item),
                    ))
                .toList(),
          ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              widget.user!.listaMinhaCorPele = await showDialog(
                context: context,
                builder: (context) => Sugestao(
                    listaUser: widget.user!.listaMinhaCorPele,
                    listaSugestoes: sugestaoCorPele,
                    limiteSelecoes: 1,
                    titulo: "A COR DA MINHA PELE É: "),
              );
              setState(() {});
            },
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text(
          "A COR DOS MEUS OLHOS É: ",
          style: TextStyle(fontSize: 18),
        ),
        if (widget.user!.listaCorOlhos != null)
          Wrap(
            children: widget.user!.listaCorOlhos!
                .map((item) => Chip(
                      label: Text(item),
                    ))
                .toList(),
          ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              widget.user!.listaCorOlhos = await showDialog(
                context: context,
                builder: (context) => Sugestao(
                    listaUser: widget.user!.listaCorOlhos,
                    listaSugestoes: sugestaoCorOlho,
                    limiteSelecoes: 1,
                    titulo: "A COR DOS MEUS OLHOS É: "),
              );
              setState(() {});
            },
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text(
          "A MINHA COMIDA PREFERIDA É: ",
          style: TextStyle(fontSize: 18),
        ),
        if (widget.user!.listaMinhaComidaPreferida != null)
          Wrap(
            children: widget.user!.listaMinhaComidaPreferida!
                .map((item) => Chip(
                      label: Text(item),
                    ))
                .toList(),
          ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              widget.user!.listaMinhaComidaPreferida = await showDialog(
                context: context,
                builder: (context) => Sugestao(
                    listaUser: widget.user!.listaMinhaComidaPreferida,
                    listaSugestoes: sugestaoComidaPreferida,
                    limiteSelecoes: widget.limiteSelecoes,
                    titulo: "A MINHA COMIDA PREFERIDA É: "),
              );
              setState(() {});
            },
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text(
          "EU GOSTO DE: ",
          style: TextStyle(fontSize: 18),
        ),
        if (widget.user!.listaGostoDe != null)
          Wrap(
            children: widget.user!.listaGostoDe!
                .map((item) => Chip(
                      label: Text(item),
                    ))
                .toList(),
          ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              widget.user!.listaGostoDe = await showDialog(
                context: context,
                builder: (context) => Sugestao(
                    listaUser: widget.user!.listaGostoDe,
                    listaSugestoes: sugestaoGostoDe,
                    limiteSelecoes: widget.limiteSelecoes,
                    titulo: "EU GOSTO DE: "),
              );
              setState(() {});
            },
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text(
          "EU NÃO GOSTO DE: ",
          style: TextStyle(fontSize: 18),
        ),
        if (widget.user!.listaNaoGostoDe != null)
          Wrap(
            children: widget.user!.listaNaoGostoDe!
                .map((item) => Chip(
                      label: Text(item),
                    ))
                .toList(),
          ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              widget.user!.listaNaoGostoDe = await showDialog(
                context: context,
                builder: (context) => Sugestao(
                    listaUser: widget.user!.listaNaoGostoDe,
                    listaSugestoes: sugestaoNaoGostoDe,
                    limiteSelecoes: widget.limiteSelecoes,
                    titulo: "EU NÃO GOSTO DE: "),
              );
              setState(() {});
            },
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text(
          "MINHA COR PREFERIDA É: ",
          style: TextStyle(fontSize: 18),
        ),
        if (widget.user!.listaCorPreferida != null)
          Wrap(
            children: widget.user!.listaCorPreferida!
                .map((item) => Chip(
                      label: Text(item),
                    ))
                .toList(),
          ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              widget.user!.listaCorPreferida = await showDialog(
                context: context,
                builder: (context) => Sugestao(
                    listaUser: widget.user!.listaCorPreferida,
                    listaSugestoes: sugestaoCorPreferida,
                    limiteSelecoes: 1,
                    titulo: "MINHA COR PREFERIDA É: "),
              );
              setState(() {});
            },
          ),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text(
          "MEU SIGNO É: ",
          style: TextStyle(fontSize: 18),
        ),
        if (widget.user!.listaSigno != null)
          Wrap(
            children: widget.user!.listaSigno!
                .map((item) => Chip(
                      label: Text(item),
                    ))
                .toList(),
          ),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("Adicionar"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              widget.user!.listaSigno = await showDialog(
                context: context,
                builder: (context) => Sugestao(
                    listaUser: widget.user!.listaSigno,
                    listaSugestoes: sugestaoSigno,
                    limiteSelecoes: 1,
                    titulo: "MEU SIGNO É: "),
              );
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
