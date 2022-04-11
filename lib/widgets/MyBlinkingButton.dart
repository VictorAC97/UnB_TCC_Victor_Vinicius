import 'package:flutter/material.dart';

class MyBlinkingButton extends StatefulWidget {
  Function()? onPressed;
  Widget? label;
  Widget? icon;
  MyBlinkingButton({Key? key, this.onPressed, this.label, this.icon})
      : super(key: key);

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
      child: TextButton.icon(
        onPressed: widget.onPressed,
        icon: widget.icon!,
        label: widget.label!,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
