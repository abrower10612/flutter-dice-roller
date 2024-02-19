import 'dart:math';
import 'package:dice_roll/widgets/dice.dart';
import 'package:dice_roll/widgets/dice_count.dart';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  List<int> dice = [1, 1];

  void rollDice() {
    for (int i = 0; i < dice.length; i++) {
      setState(() {
        dice[i] = randomizer.nextInt(6) + 1;
      });
    }
  }

  void updateCount(int newCount) {
    setState(() {
      dice = List<int>.filled(newCount, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64, bottom: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Dice(dice),
          Column(
            children: [
              DiceCount(updateCount),
              TextButton(
                onPressed: rollDice,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 28,
                    )),
                child: const Text('Roll Dice'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
