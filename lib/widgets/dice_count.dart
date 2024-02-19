import 'package:flutter/material.dart';

enum Direction { up, down }

class DiceCount extends StatefulWidget {
  final Function(int) updatedCount;

  const DiceCount(this.updatedCount, {super.key});

  @override
  State<DiceCount> createState() => _DiceCountState();
}

class _DiceCountState extends State<DiceCount> {
  int count = 2;

  void changeCount(Direction direction) {
    if (count == 1 && direction == Direction.down ||
        count == 6 && direction == Direction.up) {
      return;
    }

    setState(() {
      count = direction == Direction.up ? count + 1 : count - 1;
    });

    widget.updatedCount(count);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              changeCount(Direction.down);
            },
            child: const Text(
              '-',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            count.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 35),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {
              changeCount(Direction.up);
            },
            child: const Text(
              '+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
