import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice(this.dice, {super.key});

  final List<int> dice;

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    int rowCount = 3;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        rowCount,
        (index) {
          int startIndex = index * 2;
          int endIndex = startIndex + 2;
          List<Widget> rowChildren = [];

          for (int i = startIndex;
              i < endIndex && i < widget.dice.length;
              i++) {
            rowChildren.add(
              Image.asset(
                'assets/images/dice-${widget.dice[i]}.png',
                width: 150,
              ),
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: rowChildren,
          );
        },
      ),
    );
  }
}
