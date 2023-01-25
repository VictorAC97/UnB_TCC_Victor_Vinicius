import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/anexo_widget.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaCadastroInformacoes.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/perfil_privado_widget.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/perfil_publico_widget.dart';

class Perfil extends StatefulWidget {
  Usuario? user;
  Perfil({Key? key, this.user}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 35,
                  letterSpacing: 1.5,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              widget.user!.fotoPerfil != null
                  ? Anexo(
                      largura: 200,
                      altura: 200,
                      picture: widget.user!.fotoPerfil)
                  : _semFoto(),
              const Padding(padding: EdgeInsets.all(4)),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () async {
                  widget.user = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            CadastroInformacoes(user: widget.user!)),
                      ));
                  //carrega a foto na tela de perfil
                  setState(() {});
                },
                child: const Text('CADASTRAR INFORMAÇÕES'),
              ),
              //const Padding(padding: EdgeInsets.all(4)),
              const Divider(
                thickness: 1,
              ),
              widget.user!.isPublic == false
                  ? const PerfilPrivado()
                  : PerfilPublico(user: widget.user!)
            ],
          ),
        ),
      ),
    );
  }

  Widget _semFoto() => const Padding(
        padding: EdgeInsets.all(12.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          radius: 100,
          child: Icon(
            Icons.person,
            size: 150,
          ),
        ),
      );
}
