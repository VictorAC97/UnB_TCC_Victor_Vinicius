import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/anexo_widget.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/obter_informacoes_widget.dart';
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
              GestureDetector(
                child: widget.user!.fotoPerfil != null
                    ? Anexo(
                        largura: 200,
                        altura: 200,
                        picture: widget.user!.fotoPerfil)
                    : _semFoto(),
                onTap: () async {
                  widget.user = await showDialog(
                    context: context,
                    builder: (context) => WillPopScope(
                      // nao permite clicar fora do dialog p fechar, somente no botao retornar
                      onWillPop: () async {
                        if (!saved) {
                          return false;
                        } else {
                          return true;
                        }
                      },
                      child: ObterInformacoes(user: widget.user!),
                    ),
                  );
                  setState(() {}); //carrega a foto na tela de perfil
                },
              ),
              const Padding(padding: EdgeInsets.all(8)),
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
