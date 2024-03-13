import 'dart:async';
import 'package:flutter/material.dart';

import 'package:suppermario/control/button.dart';
import 'package:suppermario/control/cardo.dart';
import 'package:suppermario/control/jumping.dart';
import 'package:suppermario/control/kalaban.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  static double cardoX = 0;
  static double cardoY = 1;
  static double kapreX = 0.5;
  static double kapreY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = cardoY;
  String direction = "right";
  bool midrun = false;
  bool midjump = false;
  // var gameFont = GoogleFonts.pressStart2p(
  //     textStyle: TextStyle(color: Colors.white, fontSize: 20));
  double cardoSize = 100;

  void preJumpCardo() {
    time = 0;
    initialHeight = cardoY;
  }

  void jumpCardo() {
    // para hindi mag double jump
    if (midjump == false) {
      midjump = true;
      preJumpCardo();
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialHeight - height > 1) {
          midjump = false;
          setState(() {
            cardoY = 1;
          });
          timer.cancel();
        } else {
          setState(() {
            cardoY = initialHeight - height;
          });
        }
      });
    }
  }

  void moveRight() {
    direction = "right";
    killKapre();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      killKapre();
      if (buttons().userIsHoldingButtonDown() == true && cardoX + 0.02 < 1) {
        setState(() {
          cardoX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveLeft() {
    direction = "left";
    killKapre();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      killKapre();
      if (buttons().userIsHoldingButtonDown() == true && cardoX - 0.02 > -1) {
        setState(() {
          cardoX -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void killKapre() {
    if ((cardoX - kapreX).abs() < 0.05 && (cardoY - kapreY).abs() < 0.05) {
      setState(() {
        //tanggalin yung kapre
        kapreX = 2;
        cardoSize = 150;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  child: AnimatedContainer(
                    alignment: Alignment(cardoX, cardoY),
                    duration: Duration(milliseconds: 0),
                    child: midjump
                        ? jumping(
                            direction: direction,
                            size: cardoSize,
                          )
                        : myCardo(
                            direction: direction,
                            midrun: midrun,
                            size: cardoSize,
                          ),
                  ),
                ),
                Container(
                  alignment: Alignment(kapreX, kapreY),
                  child: kalaban(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Cardo Dalisay",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          // style: gameFont,
                        ),
                        Text(
                          "123",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          // style: gameFont,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "World",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          // style: gameFont,
                        ),
                        Text(
                          "1-1",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          // style: gameFont,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Time",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          // style: gameFont,
                        ),
                        Text(
                          "199",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          // style: gameFont,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttons(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      function: moveLeft,
                    ),
                    buttons(
                      child: Icon(Icons.arrow_upward, color: Colors.white),
                      function: jumpCardo,
                    ),
                    buttons(
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                      function: moveRight,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
