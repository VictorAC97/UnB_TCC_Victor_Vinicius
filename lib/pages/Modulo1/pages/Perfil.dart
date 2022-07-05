import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaCriacaoTexto.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaDadosPublicosPrivados.dart';
import 'package:projeto_final_unb/pages/Modulo1/pages/TelaObterFoto.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/anexo_widget.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/generate_user_text_widget.dart';
import 'package:projeto_final_unb/pages/Modulo1/widgets/mostrar_informacoes_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utilities/invalid_date.dart';

class Perfil extends StatefulWidget {
  Usuario? user;
  Perfil({Key? key, this.user}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late PageController _controller;
  int paginaAtual = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                      child: Dialog(
                        child: Column(
                          children: [
                            Flexible(
                              flex: 10,
                              child: PageView(
                                controller: _controller,
                                children: [
                                  TelaObterFoto(user: widget.user),
                                  TelaCriacaoTexto(user: widget.user),
                                  TelaDadosPublicosPrivados(user: widget.user),
                                ],
                                onPageChanged: (index) {
                                  setState(() {
                                    paginaAtual = index;
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: SmoothPageIndicator(
                                      controller: _controller,
                                      count: 3,
                                      effect: SwapEffect(
                                        dotWidth: 10,
                                        dotHeight: 10,
                                        activeDotColor: Colors.black,
                                        dotColor: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context, widget.user);
                                        },
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.black)),
                                        child: const Text("RETORNAR")),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  setState(() {}); //carrega a foto na tela de perfil
                },
              ),
              widget.user!.isPublic == false
                  ? privateProfile(widget.user!)
                  : publicProfile(widget.user!)
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

  bool _isTextComplete(Usuario? user) {
    if (user!.nome == "" ||
        user.idade == "" ||
        isInvalidDate(user.dataNasc!) == true ||
        user.alturaMetro == "" ||
        user.alturaCentimetro == "" ||
        user.pesoQuilos == "" ||
        user.pesoGramas == "" ||
        user.listaEuSou!.isEmpty == true) {
      return false;
    } else {
      return true;
    }
  }

  Widget publicProfile(Usuario user) {
    setState(() {});
    return Column(
      children: [
        Container(
          child: _isTextComplete(user) == false
              ? Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "AGUARDANDO INFORMAÇÕES. . .",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: listarPendencias(),
                    ),
                    const SizedBox(
                        width: 270, child: LinearProgressIndicator()),
                  ],
                )
              : GenerateUserText(
                  user: widget.user,
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
        ),
        MostrarInformacoes(user: widget.user!),
      ],
    );
  }

  Widget privateProfile(Usuario user) {
    setState(() {});
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.lock),
        Text(
          "Este perfil é privado.",
          style: TextStyle(fontSize: 24),
        )
      ],
    );
  }

  Widget listarPendencias() {
    TextStyle _textStyle = const TextStyle(fontSize: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.user!.nome == "") Text("- Nome Completo", style: _textStyle),
        if (widget.user!.idade == "") Text("- Idade", style: _textStyle),
        if (isInvalidDate(widget.user!.dataNasc!) == true)
          Text("- Data de Nascimento", style: _textStyle),
        if (widget.user!.alturaMetro == "")
          Text("- Altura Metros", style: _textStyle),
        if (widget.user!.alturaCentimetro == "")
          Text("- Altura Centimetros", style: _textStyle),
        if (widget.user!.pesoQuilos == "")
          Text("- Peso Quilos", style: _textStyle),
        if (widget.user!.pesoGramas == "")
          Text("- Peso Gramas", style: _textStyle),
        if (widget.user!.listaEuSou!.isEmpty)
          Text("- Personalidade (Eu sou)", style: _textStyle),
      ],
    );
  }
}
