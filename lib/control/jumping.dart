import 'dart:math';

import 'package:flutter/material.dart';

class jumping extends StatelessWidget {
  jumping({
    super.key, 
    this.direction,
    this.size
    });

  final direction;
  final size;
  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: size,
        height: size,
        child: Image.asset('lib/images/manananggal.png'),
      );
    } else {
      return Transform(
        transform: Matrix4.rotationY(pi),
        alignment: Alignment.center,
        child: Container(
          width: size,
          height: size,
          child: Image.asset('lib/images/manananggal.png'),
        ),
      );
    }
  }
}
