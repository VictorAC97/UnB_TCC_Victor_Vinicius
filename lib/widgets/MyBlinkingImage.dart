import 'package:flutter/material.dart';

class MyBlinkingImage extends StatefulWidget {
  String? path;
  MyBlinkingImage({Key? key, this.path}) : super(key: key);

  @override
  State<MyBlinkingImage> createState() => _MyBlinkingImageState();
}

class _MyBlinkingImageState extends State<MyBlinkingImage>
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
      child: Image.asset(widget.path!),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
