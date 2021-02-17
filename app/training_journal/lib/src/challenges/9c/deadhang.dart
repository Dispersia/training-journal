import 'package:flutter/material.dart';
import 'package:training_journal/src/challenges/9c/tile.dart';

class Deadhang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
        children: [
          ...getTiles(
            [
              Tile(10, '6min'),
              Tile(9, '5min'),
              Tile(8, '4min'),
              Tile(7, '3.5min'),
              Tile(6, '3min'),
              Tile(5, '2.5min'),
              Tile(4, '2min'),
              Tile(3, '1.5min'),
              Tile(2, '1min'),
              Tile(1, '30sec'),
            ],
          ),
        ],
      ),
    );
  }
}
