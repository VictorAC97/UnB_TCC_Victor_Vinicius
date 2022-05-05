import 'package:flutter/material.dart';

class TelaDuvidas extends StatefulWidget {
  const TelaDuvidas({Key? key}) : super(key: key);

  @override
  State<TelaDuvidas> createState() => _TelaDuvidasState();
}

class _TelaDuvidasState extends State<TelaDuvidas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("SOBRE O APP"),
        centerTitle: true,
      ),
      body: const Center(),
    );
  }
}
