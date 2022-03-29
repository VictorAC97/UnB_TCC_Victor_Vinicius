import 'package:flutter/material.dart';
import 'package:projeto_final_unb/models/Usuario.dart';
import 'package:projeto_final_unb/telas/Modulo1.dart';
import 'package:projeto_final_unb/telas/Modulo2.dart';
import 'TelaCriacaoTexto.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Usuario usuario = Usuario(nome: " ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 128, bottom: 128),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logos/logoRedesSociais2.png",
                width: 450,
              ),
              Container(
                padding: EdgeInsets.only(top: 32, left: 70, right: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "MÓDULO 1",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Modulo1(user: usuario)));
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              "MÓDULO 2",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Modulo2(user: usuario)));
                          },
                        )),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "MÓDULO 3",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
        child: Icon(
          Icons.help_outline,
          size: 40,
        ),
      ),
    );
  }
}
