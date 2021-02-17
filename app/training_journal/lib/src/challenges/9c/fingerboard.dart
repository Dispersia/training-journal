import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_journal/src/challenges/9c/tile.dart';

class Fingerboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FingerboardState();
}

class _FingerboardState extends State<Fingerboard> {
  int weight = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: [
          const Text('Hold on 20mm edge for 5 seconds'),
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
