import 'dart:math';

import 'package:flutter/material.dart';

class myCardo extends StatelessWidget {
  myCardo({super.key, this.direction, this.midrun, this.size});

  final direction;
  final midrun;
  final size;

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: size,
        height: size,
        child: midrun
            ? Image.asset('lib/images/walking.png')
            : Image.asset('lib/images/cardo.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: size,
          height: size,
          child: midrun
              ? Image.asset('lib/images/walking.png')
              : Image.asset('lib/images/cardo.png'),
        ),
      );
    }
  }
}
