import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import '../utilities/Suggestions.dart';

class DefinirPrivacidade extends StatefulWidget {
  Usuario? user;
  DefinirPrivacidade({Key? key, this.user}) : super(key: key);

  @override
  State<DefinirPrivacidade> createState() => _DefinirPrivacidadeState();
}

class _DefinirPrivacidadeState extends State<DefinirPrivacidade> {
  bool saved = false;
  late bool? isPublic = widget.user!.isPublic!;

  @override
  Widget build(BuildContext context) {
    //bloqueia o fechamento da tela caso queira fechar sem preencher
    return WillPopScope(
      onWillPop: () async {
        if (!saved) {
          return false;
        }
        return true;
      },
      child: AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Definir Privacidade"),
            IconButton(
                onPressed: () => Navigator.pop(context, isPublic),
                icon: const Icon(Icons.close_rounded)),
          ],
        ),
        content: SizedBox(
          height: 170,
          child: Column(
            children: [
              RadioListTile<bool>(
                  activeColor: Colors.black,
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Row(
                    children: [
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 8, bottom: 8, right: 18),
                          child: Icon(Icons.public)),
                      Text(sugestaoPrivacidade[0]),
                    ],
                  ),
                  subtitle:
                      const Text("Qualquer pessoa pode visualizar seu perfil"),
                  value: true,
                  groupValue: isPublic,
                  onChanged: (value) {
                    setState(() {
                      isPublic = value;
                      widget.user!.isPublic = isPublic;
                    });
                  }),
              RadioListTile<bool>(
                  activeColor: Colors.black,
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Row(
                    children: [
                      const Padding(
                          padding:
                              EdgeInsets.only(top: 8, bottom: 8, right: 18),
                          child: Icon(Icons.lock)),
                      Text(sugestaoPrivacidade[1]),
                    ],
                  ),
                  subtitle:
                      const Text("Somente você pode visualizar seu perfil"),
                  value: false,
                  groupValue: isPublic,
                  onChanged: (value) {
                    setState(() {
                      isPublic = value;
                      widget.user!.isPublic = isPublic;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
