import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import '../utilities/Suggestions.dart';

class DefinirPrivacidade extends StatefulWidget {
  Usuario? user;
  DefinirPrivacidade({Key? key, this.user}) : super(key: key);

  @override
  State<DefinirPrivacidade> createState() => _DefinirPrivacidadeState();
}

bool? isPublic;

class _DefinirPrivacidadeState extends State<DefinirPrivacidade> {
  bool saved = false;

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
            Text("Definir Privacidade"),
            IconButton(
                onPressed: () => Navigator.pop(context, isPublic),
                icon: Icon(Icons.close_rounded)),
          ],
        ),
        content: Container(
          height: 170,
          child: Column(
            children: [
              RadioListTile<bool>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Row(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 8, bottom: 8, right: 18),
                          child: Icon(Icons.public)),
                      Text(sugestaoPrivacidade[0]),
                    ],
                  ),
                  subtitle: Text("Qualquer pessoa pode visualizar seu perfil"),
                  value: true,
                  groupValue: isPublic,
                  onChanged: (value) {
                    setState(() {
                      isPublic = value;
                      widget.user!.isPublic = isPublic;
                    });
                  }),
              RadioListTile<bool>(
                  controlAffinity: ListTileControlAffinity.trailing,
                  title: Row(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 8, bottom: 8, right: 18),
                          child: Icon(Icons.lock)),
                      Text(sugestaoPrivacidade[1]),
                    ],
                  ),
                  subtitle: Text("Somente você pode visualizar seu perfil"),
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
