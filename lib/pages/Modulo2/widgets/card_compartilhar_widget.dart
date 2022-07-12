import 'package:flutter/material.dart';

class CardCompartilharWidget extends StatelessWidget {
  final int index;
  const CardCompartilharWidget({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
    );
  }
}
