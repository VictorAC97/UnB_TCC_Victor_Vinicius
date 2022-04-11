import 'package:flutter/material.dart';

class TelaCurtir extends StatefulWidget {
  TelaCurtir({Key? key}) : super(key: key);

  @override
  State<TelaCurtir> createState() => _TelaCurtirState();
}

class _TelaCurtirState extends State<TelaCurtir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
