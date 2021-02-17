import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_journal/src/challenges/9c/tile.dart';

class Pullup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PullupState();
}

class _PullupState extends State<Pullup> {
  int weight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: [
          const Text('Forward grip pullup, chin over bar'),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(labelText: 'Weight'),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              setState(() {
                weight = int.parse(value);
              });
            },
          ),
          if (weight > 0)
            ...getTiles(
              [
                Tile(10, '${weight * 1.20}'),
                Tile(9, '${weight * 1.0}'),
                Tile(8, '${weight * .8}'),
                Tile(7, '${weight * .6}'),
                Tile(6, '${weight * .5}'),
                Tile(5, '${weight * .4}'),
                Tile(4, '${weight * .3}'),
                Tile(3, '${weight * .2}'),
                Tile(2, '${weight * .1}'),
                Tile(1, '0'),
              ],
            ),
        ],
      ),
    );
  }
}
