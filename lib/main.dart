import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int LeftDiceNumber = (6);
  int RightDiceNumber = 6;
  void changeDice() {
    setState(() {
      LeftDiceNumber = Random().nextInt(6) + 1;
      RightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextButton(
            child: Image.asset('images/dice$LeftDiceNumber.png'),
            onPressed: () {
              changeDice();
              if (RightDiceNumber > LeftDiceNumber) {
                print("Player 2 Wins!!");
              } else if (RightDiceNumber == LeftDiceNumber) {
                print("Its a Draw!!!");
              } else if (RightDiceNumber < LeftDiceNumber) {
                print("Player 1 Wins!!!");
              }
            },
          )),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    changeDice();
                    if (RightDiceNumber > LeftDiceNumber) {
                      print("Player 2 Wins!!");
                    } else if (RightDiceNumber == LeftDiceNumber) {
                      print("Its a Draw!!!");
                    } else if (RightDiceNumber < LeftDiceNumber) {
                      print("Player 1 Wins!!!");
                    }
                  },
                  child: Image.asset('images/dice$RightDiceNumber.png'))),
        ],
      ),
    );
  }
}
