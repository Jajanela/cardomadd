import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  buttons({
    super.key,
    this.child,
    this.function,
  });

  final child;
  final function;
  static bool holdingButton = false;

  bool userIsHoldingButtonDown() {
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        holdingButton = true;
        function();
      },
      onTapUp: (details) {
        holdingButton = false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.brown[300],
          child: child,
        ),
      ),
    );
  }
}
