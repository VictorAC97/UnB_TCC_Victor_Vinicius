import 'package:flutter/material.dart';

class MyBlinkingButton extends StatefulWidget {
  MyBlinkingButton({Key? key}) : super(key: key);

  @override
  State<MyBlinkingButton> createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.thumb_up),
        label: Text("Teste"),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
